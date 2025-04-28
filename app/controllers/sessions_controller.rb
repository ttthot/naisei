# frozen_string_literal: true

class SessionsController < ApplicationController
  # get '/login'のルーティングに対応するアクション
  def new
    # @session = Session.newはモデルを使用しないため不要
  end

  # post '/login'のルーティングに対応するアクション
  def create
    # emailカラムがparams[:session][:email]の値と一致するユーザーを検索しています。
    user = User.find_by(email: params[:session][:email].downcase)
    # @userがnilでない場合、つまりユーザーが存在する場合
    if user&.authenticate(params[:session][:password])
      # redirect_to user_path(user)に変換される
      # redirect_to user_path(user.id)に変換される
      # redirect_to user_path(1)
      # /users/1にリダイレクトされる
      log_in(user)
      # noticeとは、リダイレクト後に表示されるメッセージ
      redirect_to user, notice: 'ログインしました'
      # 今回はモデルを定義しないため、errorsは使いえない
    else
      # nowを使う
      # flashは次のリクエストが来るまで表示される
      # flash.nowは現在のリクエストにのみ表示される
      flash.now[:danger] = 'メールアドレスまたはパスワードが無効です'
      render 'new', status: :unprocessable_entity
    end
  end
end
