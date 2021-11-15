class Tree < ApplicationRecord
  has_many :layers, dependent: :destroy 
  belongs_to :user

  enum state: { private_tree: 0, public_tree: 1}
end
