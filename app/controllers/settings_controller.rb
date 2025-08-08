# frozen_string_literal: true


class SettingsController < ApplicationController
  layout "sidebar_layout"
  def index
  end

  def update
    # 自分の設定のみ扱うため current_user
    if current_user.update(habit_params)
      #  　まっさらなidexページにリダイレクト
      redirect_to settings_path, notice: ""
    else
      # 入力データとエラー情報が保持されたままにしたいのでrender再表示
      render :index, status: :unprocessable_entity
    end
  end

  # 編集画面はindexと同じなのでeditは不使用
  def edit
  end

  private
    # RailsのStrong Parametersを設定
    def habit_params
      # # params[:user][:diary_trigger_action]等を許可
      params.require(:user).permit(:diary_trigger_action, :diary_trigger_time,
                                 :diary_reward, :diary_preparation)
    end
end
