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
    if user&.authenticate(params[:session][:email])
      puts 'ログイン成功'
    else
      render 'new', status: :unprocessable_entity
    end
  end
end
