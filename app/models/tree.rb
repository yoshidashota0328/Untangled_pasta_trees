class Tree < ApplicationRecord
  has_many :layers, dependent: :destroy 
  belongs_to :user
  validates :title, presence: true, length: { in:1..10 }
  validates :description, length: { in:1..10 }

  enum state: { private_tree: 0, public_tree: 1}
end
