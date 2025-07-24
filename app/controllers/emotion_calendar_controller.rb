class EmotionCalendarController < ApplicationController
  # サイドバー設置レイアウトファイル変更
  layout "sidebar_layout"
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
end
