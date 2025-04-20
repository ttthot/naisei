class AddDetailsToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :user, null: false, foreign_key: true
    add_reference :posts, :topic, null: false, foreign_key: true
    add_column :posts, :emotion_label, :string
    add_column :posts, :emotion_rating, :integer
  end
end
