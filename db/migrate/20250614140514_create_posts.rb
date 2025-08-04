class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|  # ← if_not_exists: true を削除
      t.references :user, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true
      t.integer :emotion, null: false, default: 0
      t.integer :emotion_rating, null: false, default: 0
      t.text :content
      t.timestamps
    end
  end
end
