# frozen_string_literal: true

class EmotionCalendarController < ApplicationController
  def index
    # データ一覧を取得
    @posts = Post.where(user_id: current_user.id)
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
    start_date = Date.new(Date.today.year, 1, 1)
    today = Date.today
    (start_date..today).each do |date|
      @calendar_dates << date
    end
  end
  # def index
  #   @dates = (0..29).map { |i| Date.today - 29 + i }

  #   # テスト用の感情データ（本来はDBから取得）
  #   @emotions = {
  #     (Date.today - 20).to_s => { emotion: "happy", intensity: 4 },
  #     (Date.today - 15).to_s => { emotion: "sad", intensity: 3 },
  #     (Date.today - 5).to_s => { emotion: "angry", intensity: 5 },
  #     (Date.today).to_s => { emotion: "excited", intensity: 4 }
  #   }
  # end
end
