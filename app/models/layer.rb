class Layer < ApplicationRecord
  enum branch: { left: 0, left_down: 1, right: 2, right_down: 3 }
  belongs_to :tree
end
