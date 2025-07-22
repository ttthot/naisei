# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # ヘルパーメソッドのlogin_in?メソッドを全体で使用するためにinclude
  include SessionsHelper
  # line_controller除く全てのコントローラーのアクションでログイン済みユーザーかどうかを確認するためのフィルター
  before_action :logged_in_user

  private
    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
end
