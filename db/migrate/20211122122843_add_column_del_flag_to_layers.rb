class AddColumnDelFlagToLayers < ActiveRecord::Migration[5.2]
  def change
    add_column :layers, :del_flag, :integer, default: 0
  end
end
