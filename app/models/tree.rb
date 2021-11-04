class Tree < ApplicationRecord
  has_many :layers, dependent: :destroy 
  belongs_to :user
end
