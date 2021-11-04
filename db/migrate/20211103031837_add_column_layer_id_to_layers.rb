class AddColumnLayerIdToLayers < ActiveRecord::Migration[5.2]
  def change
    add_column :layers, :layer_id, :integer
  end
end
