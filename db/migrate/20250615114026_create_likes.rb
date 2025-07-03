class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      # nullは許可しない
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
      # user_idとpost_idの組み合わせが重複しないようにする制約、フロントでも規制しているがバックエンドでも規制
      t.index [:user_id, :post_id], unique: true
    end
  end
end
