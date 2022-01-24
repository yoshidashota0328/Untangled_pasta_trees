# frozen_string_literal: true

class AddColumnDbIdToLayers < ActiveRecord::Migration[5.2]
  def change
    add_column :layers, :db_id, :integer
  end
end
