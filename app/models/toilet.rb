class Toilet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings

  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true, length: { in: 5..50 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { in: 10..500 }
  validates :address, presence: true
end
