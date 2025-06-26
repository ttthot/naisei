# Postモデルは、ユーザーとトピックに関連付けられた投稿を表します。
# このモデルには以下の機能があります:
#
# - `belongs_to :user`: 投稿は1人のユーザーに属します。
# - `belongs_to :topic`: 投稿は1つのトピックに属します。
# - `enum emotion_label`: 投稿の感情ラベルを表す列挙型。以下の感情がサポートされています:
#   - `happy`: 😊
#   - `sad`: 😢
#   - `angry`: 😠
#   - `neutral`: 😐
#   - `excited`: 🎉
# - `validates :emotion_rating`: 感情の評価は1から5の範囲内である必要があります（nilも許容されます）。
# - `validates :content`: 投稿の内容は必須です。
class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :topic
  # ポスト削除時に関連するいいねも削除するためアソシエーションオプションを設定
  # destroyオプションはbelogns_toの関連付けに対しては使用できない、has_manyを使用
  has_many :likes, dependent: :destroy
  # 感情ラベルをenum化
  enum emotion_label: {
    happy: "😊",
    sad: "😢",
    angry: "😠",
    neutral: "😐",
    excited: "🎉"
  }

  validates :emotion_rating, inclusion: { in: 1..5 }, allow_nil: true
  validates :content, presence: true
end
