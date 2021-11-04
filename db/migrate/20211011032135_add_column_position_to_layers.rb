class AddColumnPositionToLayers < ActiveRecord::Migration[5.2]
  def change
    add_column :layers, :positionX, :integer, null: false, default: 0
    add_column :layers, :positionY, :integer, null: false, default: 0
    add_column :layers, :title, :string
    add_column :layers, :body, :text
    add_column :layers, :parent_id, :integer
  end
end
