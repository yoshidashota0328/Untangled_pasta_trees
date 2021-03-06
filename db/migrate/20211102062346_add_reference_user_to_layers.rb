# frozen_string_literal: true

class AddReferenceUserToLayers < ActiveRecord::Migration[5.2]
  def change
    add_reference :layers, :user, foreign_key: true
    add_reference :layers, :tree, foreign_key: true
  end
end
