class UpdatePostsTable < ActiveRecord::Migration[7.1]
  def change
    change_column :posts, :emotion, :integer, default: 0
    remove_column :posts, :title, :string if column_exists?(:posts, :title)
  end
end
