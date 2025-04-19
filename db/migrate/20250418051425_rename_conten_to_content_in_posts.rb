class RenameContenToContentInPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :conten, :content
  end
end
