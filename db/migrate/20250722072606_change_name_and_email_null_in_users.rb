class ChangeNameAndEmailNullInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :name, true
    change_column_null :users, :email, true
  end
end
