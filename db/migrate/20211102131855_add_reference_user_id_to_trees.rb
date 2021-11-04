class AddReferenceUserIdToTrees < ActiveRecord::Migration[5.2]
  def change
    add_reference :trees, :user, foreign_key: true
  end
end
