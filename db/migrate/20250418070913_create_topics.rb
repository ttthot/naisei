# frozen_string_literal: true

# Migration to create the topics table with title field and timestamps
class CreateTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :topics do |t|
      t.string :title

      t.timestamps
    end
  end
end
