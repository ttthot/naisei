class AddLoginAndPostStreaksToUsers < ActiveRecord::Migration[7.1]
  def change
    # 連続ログイン系
    add_column :users, :login_streak, :integer, default: 0, null: false
    add_column :users, :max_login_streak, :integer, default: 0, null: false
    add_column :users, :last_logged_in_at, :date

    # 連続投稿系
    add_column :users, :post_streak, :integer, default: 0, null: false
    add_column :users, :max_post_streak, :integer, default: 0, null: false
    add_column :users, :last_posted_at, :date
  end
end
