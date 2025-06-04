# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # findメソッドのUser.find(1)に変換される
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # binding.irb はデバッグ用のコードで、実行時にインタラクティブなコンソールを開く
    # binding.irb
    @user = User.new(user_params)
    # rubyはfalseかnil以外の値はtrueとみなす
    if @user.save
      # log_in(@user)はSessionHelper.rbで定義されたメソッドで、ユーザーIDをセッションに保存しログイン状態を管理します。
      log_in(@user)
      # redirect_to @user は以下のように展開:
      # 1. ActiveRecordオブジェクトを渡すと、Railsは自動的にモデル名とIDを使ってパスを構築
      # 2. 例えば @user.id が 1 の場合、redirect_to @user は redirect_to user_path(1) と同等
      # 3.  /users/1 というURLにリダイレクト
      # 4. このルーティングは config/routes.rb の resources :users によって定義

      # redirect_to @user, notice: "ユーザーを作成しました"
      redirect_to new_post_path, notice: "アカウントが作成されました！投稿を始めましょう。"
    else
      # バリデーションエラーが発生した場合、新規作成フォームを再表示する
      render "new", status: :unprocessable_entity
    end
  end
  # privateメソッドは、クラス内でのみ使用できる
  # つまり、クラスの外からはアクセスできない

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
