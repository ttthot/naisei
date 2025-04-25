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
    @user = User.new(user_params)
    
    if @user.save
      # redirect_to user_path(@user)に変換され/users/1にリダイレクトされる
      # これはRailsのルーティングによるもので、resources :usersが定義されているため
      redirect_to @user, notice: 'ユーザーを作成しました'
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end