# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
topics = [
  "今日、あなたはどんな気持ちで過ごしましたか？",
  "最近、心に強く残った出来事は何ですか？",
  "今感じている感情を言葉にするとしたら？",
  "昨日の自分と比べて、どんな成長を感じますか？",
  "今日、誰かに感謝したいことはありましたか？",
  "未来の自分に伝えたいことは何ですか？",
  "自分自身の課題だと思うことは何ですか？",
  "最近、どんな瞬間に心が動きましたか？",
  "あなたにとって大切な価値観は何ですか？",
  "理想の自分に近づくために何ができますか？"
]

topics.each do |title|
  Topic.find_or_create_by!(title: title)
end
# ユーザーが存在しない場合のみ作成
User.find_or_create_by!(email: "admin@example.com") do |user|
  user.name = "管理者ユーザー"
  user.password = "password123"
end
