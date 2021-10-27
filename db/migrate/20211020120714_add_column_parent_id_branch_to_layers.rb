class AddColumnParentIdBranchToLayers < ActiveRecord::Migration[5.2]
  def change
    add_column :layers, :parent_id, :integer
    add_column :layers, :branch, :integer, default: 0
  end
end
