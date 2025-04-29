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
    # rubyはfalseかnil以外の値はtrueとみなす
    if @user.save
      log_in(@user)
      # redirect_to user_path(@user)に変換され
      # redirect_to user_path(@user.id)に変換される
      # redirect_to user_path(1)
      # /users/1にリダイレクトされる
      # これはRailsのルーティングによるもので、resources :usersが定義されているため
      redirect_to @user, notice: 'ユーザーを作成しました'
    else
      # バリデーションエラーが発生した場合、新規作成フォームを再表示する
      render 'new', status: :unprocessable_entity
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
