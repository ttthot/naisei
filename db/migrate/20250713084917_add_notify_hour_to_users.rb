class AddNotifyHourToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :notify_hour, :integer
  end
end
