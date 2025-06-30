class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      # ユーザーとトピックへの関連付け
      t.references :user, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      # 感情の種類（integer型に変更した）
      t.integer :emotion, null: false, default: 0

      # 感情の強度
      t.integer :emotion_rating, null: false, default: 0
      # タイトルは別テーブルのため削除した　t.string :title
      t.text :content
      t.timestamps
    end
  end
end
