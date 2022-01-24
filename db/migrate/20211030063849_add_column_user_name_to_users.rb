# frozen_string_literal: true

class AddColumnUserNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_name, :string
    add_index :users, :user_name, unique: true
  end
end
