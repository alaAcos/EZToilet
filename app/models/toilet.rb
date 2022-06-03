class Toilet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_many :associations
  has_many :features, through: :associations
  accepts_nested_attributes_for :features
  attr_accessor :features_ids

  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true, length: { in: 5..50 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { in: 10..500 }
  validates :address, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
                  against: [ :name, :description ],
                  using: {
                    tsearch: { prefix: true }
                  }
end
