

# frozen_string_literal: true

# 記事を取得する
class PostsController < ApplicationController
  #  ログイン必須機能はapplication_controller.rbに移動した
  # サイドバー設置レイアウトファイル変更（indexのみ）
  layout "sidebar_layout", only: [:index]

  def index
    # ビューがurlを作成　posts_path(page: @current_page + 1)
    # urlから何ページ目かを取得、例えばurlが/posts?page=2の場合、current_pageは2になる
    @current_page = params[:page].to_i
    @current_page = 1 if @current_page == 0

    # 1ページあたりの表示件数
    @per_page = 5
    # offsetとはｘｘ件スキップすること Post.limit(10).offset(10)な１０件目からスタート
    offset = (@current_page - 1) * @per_page
    if params[:scope] == "mine"
      # Postモデルからデータを取得
      @posts = Post.includes(:user, :topic).where(user_id: current_user.id).order(created_at: :desc).limit(@per_page).offset(offset)
      @total_posts = Post.where(user_id: current_user.id).count
      @scope = "mine"
    else
      # Postモデルからデータを取得、オフセットな何件めから取得するかを指定メメソッド順番は問われないいが、、、
      # @posts = Post.order(created_at: :desc).limit(@per_page).offset(offset)
      # N+1問題を解決 最初に投稿一覧を1回、ID一覧を1回の合計2回
      @posts = Post.includes(:user, :topic).order(created_at: :desc).limit(@per_page).offset(offset)
      # ページネーション機能用
      @total_posts = Post.count
      @scope = "all"
    end
    @total_pages = (@total_posts.to_f / @per_page).ceil

    @has_next_page = @current_page < @total_pages
    @has_previous_page = @current_page > 1
  end

  def new
    @post = Post.new
    set_random_topic
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id # ログイン中のユーザーのIDを設定

    if @post.save
      if params[:commit] == "post"
        # posts_path	==> /posts
        # 投稿一覧画面に戻る
        redirect_to posts_path # notice: "記事を作成しました"  メッセージが欲しい時はコメントを外す
      elsif params[:commit] == "post_and_aiadvice"
        service = ChatgptService.new
        ai_response = service.get_chatgpt_response(@post.content)
        flash[:notice] = "記事を作成しました。AIからのアドバイス: #{ai_response}"
        redirect_to posts_path
      end
    else
      # デバッグ情報を追加
      Rails.logger.info "保存エラー: #{@post.errors.full_messages.join(', ')}"
      set_random_topic
      # :newアクションにリダイレクト
      render :new
    end
  end


  private
    def set_random_topic
      topics = Topic.all
      @random_topic = topics.sample

      if @random_topic.nil?
        Rails.logger.info "Failed to get random topic from #{topics.count} topics"
        @random_topic = topics.first || Topic.create!(title: "デフォルトトピック")
      end
    end

    # Postモデルのストロングパラメータメソッド。
    # paramsハッシュから:content属性と:topic_id属性を許可します。
    # これにより、作成や更新時に使用できるパラメータを明示的に指定することで脆弱性を防ぎます。
    def post_params
      params.require(:post).permit(:content, :topic_id, :emotion, :emotion_rating)
    end
end
