# app/controllers/likes_controller.rb

class LikesController < ApplicationController
  # ログインチェックをコントローラーの先頭で行う
  before_action :logged_in_user

  def create
    # createアクションに必要な変数を、このアクション内で全て定義する
    #  /posts/:post_id/likesからpostidを取得
    # ちなみに:post_idは親リソースの単数系_idという形式で自動作成される
    post = Post.find(params[:post_id])

    # --- createアクションのロジックに関するあなたのメモ ---
    # 一番シンプルな方法はLike.create(user_id: current_user.id, post_id: @post.id)
    # しかし、これではcurrent_userがnilのときにエラーになる
    # 右辺　ユーザーid等を取得.hasmany:likesよりメソッド生成.同様にcreateも生成
    # (post 属性に: @post オブジェクトを関連付けpost_idを自動的に設定)
    like = post.likes.new(user: current_user)

    if like.save
      @post = post # Turbo Streamビューで使うためにインスタンス変数にセット
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @post }
      end
    else
      redirect_to post, alert: "いいねに失敗しました"
    end
  end

  def destroy
    # destroyアクションに必要な変数を、このアクション内で全て定義する
    # 取得できない場合はnilが返る、これを想定してfind_byを使用
    like = current_user.likes.find_by(id: params[:id])

    if like
      @post = like.post
      # @likeはcurrent_user.likes.find(params[:id])で取得しているので、current_userのlikesから削除される
      like.destroy

      # respondto リクエストの形式html等によってレスポンスを変える
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to posts_path }
      end
    else
      # 既にいいねが存在しない場合は、エラーにせず、何もしないのが安全
      head :ok
    end
  end

  # privateセクションは、このコントローラーでは不要です
end
