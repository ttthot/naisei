# frozen_string_literal: true

class AddShowTopicTitleToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :show_topic_title, :boolean, default: true, null: false
  end
end
