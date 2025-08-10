# frozen_string_literal: true

class EmotionCalendarController < ApplicationController
  # サイドバー設置レイアウトファイル変更
  layout "sidebar_layout"
  def index
    # TODO後で消す: デバッグ用フラッシュ内容確認コード
    Rails.logger.debug "Current flash content: #{flash.inspect}"
    
    # データ一覧を取得
    @posts = current_user.posts
    # 日付で投稿をマッピングするハッシュを初期化
    @date_post_map = {}

    @posts.each do |post|
      # 日付のみを文字列として取得、同じ日に複数投稿があるときは上書き
      date_string = post.created_at.to_date.to_s
      # ビューで使用するために、日付をキー、感情と評価を値とするハッシュを作成
      @date_post_map[date_string] = {
        emotion: post.emotion,
        rating: post.emotion_rating,
        id: post.id
      }
    end
    # 投稿ない日のことも考えて、すべての日のマス欄を作成
    @calendar_dates = []
    start_date = Date.new(Time.zone.today.year, 1, 1)
    # サーバー標準時間から日本時間に変換
    # config.time_zone = 'Tokyo'　にて設定済み
    today = Time.zone.today
    (start_date..today).each do |date|
      @calendar_dates << date
    end
    # ビューで7日ごとに分けるために、7日ごとにグループ化
    @calendar_weeks = @calendar_dates.in_groups_of(7, false)
  end
end
