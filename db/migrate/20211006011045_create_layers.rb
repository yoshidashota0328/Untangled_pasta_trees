# frozen_string_literal: true

class CreateLayers < ActiveRecord::Migration[5.2]
  def change
    create_table :layers, &:timestamps
  end
end
