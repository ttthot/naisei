# frozen_string_literal: true

# モデルに書くのはデータベースに関連するものとアプリの仕組み　今回でいえば連続ログイン
class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy
  # # これによりインスタンスメソッド .likes が生成
  # ユーザー削除時に関連するいいねも削除するためアソシエーションオプション:を設定
  has_many :likes, dependent: :destroy
  # userが「いいね」したpostを取得したいので設定
  # userはlikeを通じてpostをたくさん持っていると定義する
  # User ---< Like >--- Post の関係をたどる
  # liked_posts は自分で命名したアソシエーション（自由に決められる）
  # source: :post は「中間モデルlikeの中にある belongs_to :post を使う」という意味
  # これがないと、Railsは like モデルに liked_post という関連があると勘違いしてエラーになる
  has_many :liked_posts, through: :likes, source: :post

  # バリデーションを追加
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  # パスワードの長さを制限
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :line_user_id, uniqueness: true, allow_nil: true

  # 習慣支援機能長さ制限
  validates :diary_trigger_action, length: { maximum: 100 }
  validates :diary_trigger_time, length: { maximum: 100 }
  validates :diary_reward, length: { maximum: 100 }
  validates :diary_preparation, length: { maximum: 255 }

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



  # 習慣設定が完了しているか　ビュー側で表示に制御をかける 将来用
  def habit_setup_completed?
    diary_trigger_action.present? && diary_trigger_time.present? &&
    diary_reward.present? && diary_preparation.present?
  end
  # 以下は設定のビューの
  # 日記のトリガーアクション選択肢
  DIARY_TRIGGER_OPTIONS = [
    "歯磨き後",
    "コーヒーを淹れる前",
    "夕食後",
    "お風呂の後",
    "寝る前",
    "夕食の準備前",
    "テレビを見る前",
    "読書の前",
    "スマホを見る前"
  ]

  # 日記のご褒美選択肢
  DIARY_REWARD_OPTIONS = [
    "好きなビールを飲む",
    "ダークチョコレートを食べる",
    "音楽を聴く",
    "SNSを見る",
    "ストレッチする",
    "お気に入りの本を読む",
    "瞑想をする",
    "コーヒーを淹れて飲む",
    "アロマディフューザーを使う",
    "軽い筋トレをする",
    "熱めの風呂に入る",
    "夜の散歩をする",
    "映画やドラマを見る",
    "お気に入りのゲームをする",
    "サウナ動画を見る",
    "首や肩をマッサージする",
    "深呼吸・呼吸法をする",
    "好きなYouTubeを見る",
    "プロテインドリンクを作る",
    "お気に入りの漫画を読む"
  ]
  # 日記の事前準備選択肢
  DIARY_PREPARATION_OPTIONS = [
    "SNSアプリを開かない",
    "YouTubeを見ない",
    "ニュースサイトを見ない",
    "通知を切らずに始めない",
    "長文を書こうとしない",
    "完璧な文章を書こうとしない",
    "毎日書けなくても自分を責めない",
    "時間を気にしすぎない",
    "「今日は何もない」と諦めない",
    "疲れているからと後回しにしない",
    "散らかった場所で書き始めない",
    "他の作業と同時にやらない",
    "バッテリー残量を確認せずに始めない",
    "「特別な出来事がない」を理由にしない",
    "気分が乗らないからと延期しない",
    "「明日まとめて書けばいい」と思わない",
    "「今週はもう遅れているから」と諦めない",
    "「誰も読まないから意味がない」と考えない",
    "「今日は飲み過ぎた」を理由にしない",
    "「風呂に入ってから書こう」と先延ばししない"
  ].freeze
end
