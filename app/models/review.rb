class Review < ApplicationRecord
  belongs_to :user
  belongs_to :toilet

  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
end
