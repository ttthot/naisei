# frozen_string_literal: true


class SettingsController < ApplicationController
  layout "sidebar_layout"
  def show
  end

  def update
    Rails.logger.debug "パラメータ: #{params[:user].inspect}"
    if current_user.update(habit_params)
      redirect_to settings_path, notice: ""
    else
      render :show, status: :unprocessable_entity
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
                                  :diary_reward, :diary_preparation, :show_topic_title)
    end
end
