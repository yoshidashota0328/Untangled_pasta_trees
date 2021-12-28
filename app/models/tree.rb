class Tree < ApplicationRecord
  has_many :layers, dependent: :destroy 
  belongs_to :user
  validates :title, presence: true, length_with_wide_char: { maximum: 20 }
  validates :description, length_with_wide_char: { maximum: 20 }

  enum state: { private_tree: 0, public_tree: 1}
end
