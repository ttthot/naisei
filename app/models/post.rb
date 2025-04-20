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
class Post < ApplicationRecord
  # TODO: 認証実装後にoptional: trueを削除する - 2025/04/20
  belongs_to :user, optional: true
  belongs_to :topic
  
  # 感情ラベルをenum化
  enum emotion_label: {
    happy: "😊",
    sad: "😢",
    angry: "😠",
    neutral: "😐",
    excited: "🎉"
  }
  
  validates :emotion_rating, inclusion: { in: 1..5 }, allow_nil: true
end
