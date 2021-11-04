class CreateTrees < ActiveRecord::Migration[5.2]
  def change
    create_table :trees do |t|
      t.string :title
      t.string :description
      t.integer :leaf_count

      t.timestamps
    end
  end
end
