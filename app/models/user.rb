# frozen_string_literal: true

# モデルに書くのはデータベースに関連するものとアプリの仕組み　今回でいえば連続ログイン
class User < ApplicationRecord
  has_secure_password
  has_many :posts
  # # これによりインスタンスメソッド .likes が生成
  # ユーザー削除時に関連するいいねも削除するためアソシエーションオプション:を設定
  has_many :likes, dependent: :destroy

  # バリデーションを追加
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  # パスワードの長さを制限
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :line_user_id, uniqueness: true, allow_nil: true

  # ----連続投稿機能 メイン関数は一番最後----

  # --ログイン時に連続投稿かどうかを毎回確認
  def check_post_streak_on_login!
    # 今日か昨日投稿してたら見逃す
    return if posted_today? || posted_yesterday? || post_streak == 0
    reset_post_streak
  end

  # ログイン時などに連続投稿が途絶えていたら streak をリセット
  def reset_post_streak
    self.post_streak = 0
    save!
    puts "連続投稿が途絶えたよ"
  end

  # --投稿時の動作
  def current_post_streak_message
    "#{post_streak}日連続投稿達成"
  end

  # 今日すでに投稿しているかどうかを確認する
  def posted_today?
    last_posted_at == Date.current
  end

  # 昨日投稿していたかどうかを確認する（streak継続条件）
  def posted_yesterday?
    last_posted_at == Date.yesterday
  end

  # 連続投稿数を増やす＋最長記録を更新
  def increment_post_streak
    self.post_streak += 1
    # 最長記録の更新
    if post_streak > max_post_streak
      self.max_post_streak = post_streak
      puts "最長記録を更新したよ"
    end
    # メソッドはセルフ不要
    # save!
  end


  # !は強制操作を意味する
  # メイン関数
  def update_post_streak!
    return if posted_today?
    puts "活動したよ"

    # 連続投稿判定
    if posted_yesterday?
      puts "昨日も活動したよ"
      # 記録更新
      increment_post_streak
    else
      self.post_streak = 1
    end
    # 最長記録処理
    if post_streak > max_post_streak
      self.max_post_streak = post_streak
      puts "最長記録を更新したよ"
    end

    self.last_posted_at = Date.current
    save!
    puts "連続投稿数を更新したよ"
  end
  # --------連続投稿機能-
end
