# frozen_string_literal: true

# Postモデルは、ユーザーとトピックに関連付けられた投稿を表します。
#
# - `belongs_to :user`: 投稿は1人のユーザーに属します。
# - `belongs_to :topic`: 投稿は1つのトピックに属します。
# - `validates :emotion_rating`: 感情の評価は1から5の範囲内である必要があります（nilも許容
# - `validates :content`: 投稿の内容は必須
class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :topic
  # 親モデルはposts、子モデルはlikes
  # ポストが削除されると、そのポストに関連する全てのいいねも自動的に削除
  # destroyオプションはbelogns_toの関連付けに対しては使用できない、has_manyを使用
  has_many :likes, dependent: :destroy
  # 感情ラベルをenum化、最終的には右側の整数値で保存されるためdbの設定とは矛盾しない
  # enuｍのヘルパーメソッドで使えるものは、真偽、更新、取得等
  enum emotion: {
    neutral: 0, # 😐
    happy:   1, # 😊
    sad:     2, # 😢
    angry:   3,  # 😠
    excited: 4 # "🎉"
  }

  validates :emotion_rating, inclusion: { in: 1..5 }, allow_nil: true
  validates :content, presence: true, length: { maximum: 300 }

  # 投稿を作成した後に行う
  after_create :update_user_post_streak

  def update_user_post_streak
    #  Userモデルのメソッドなので、、
    user.update_post_streak!
  end
end
