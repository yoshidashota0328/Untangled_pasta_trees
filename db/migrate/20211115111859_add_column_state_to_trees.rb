# frozen_string_literal: true

class AddColumnStateToTrees < ActiveRecord::Migration[5.2]
  def change
    add_column :trees, :state, :integer, default: 0, null: false
  end
end
