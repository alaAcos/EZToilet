class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :toilet

  # This validation might have to be removed if it causes problems with the bookings, it is intended
  validates :status, inclusion: { in: ["pending", "confirmed", "denied"], message: "%{value} is not a valid status" }
end
