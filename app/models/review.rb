class Review < ApplicationRecord
  belongs_to :user
  belongs_to :toilet

  validates :comment, :rating, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }

  scope :by_recently_created, -> { order(created_at: :desc) }
end
