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
      # log_inメソッドの説明
      # session[:user_id] = user.id
      # session[:user_id]は、現在ログインしているユーザーのIDを保持するためのセッション変数です。
      # session[:user_id]は、ユーザーがログインしている間、サーバー側で保持されます。
      log_in(user)

      # new_post_pathは通常/posts/newに対応します。
      # redirect_toは、HTTPレスポンスに302ステータスコードを設定し、Locationヘッダーにリダイレクト先のURLを指定します。
      redirect_to new_post_path, notice: 'ログインしました'
      # 今回はモデルを定義しないため、errorsは使いえない
    else
      # nowを使う
      # flashは次のリクエストが来るまで表示される
      # flash.nowは現在のリクエストにのみ表示される
      flash.now[:danger] = 'メールアドレスまたはパスワードが無効です'
      render 'new', status: :unprocessable_entity
    end
  end

  # delete '/logout'のルーティングに対応するアクション
  def destroy
    # session.delete(:user_id)はsession[:user_id] = nilと同じ
    # session.delete(:user_id)はsession[:user_id]を削除する
    log_out
    # root_pathとは    # localhost:3000/にリダイレクトされる
    redirect_to root_url, notice: 'ログアウトしました'
  end
end
