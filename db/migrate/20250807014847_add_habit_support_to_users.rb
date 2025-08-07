class AddHabitSupportToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :diary_trigger_action, :string
    add_column :users, :diary_trigger_time, :string
    add_column :users, :diary_reward, :string
    add_column :users, :diary_preparation, :string
  end
end
