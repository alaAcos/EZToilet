class Feature < ApplicationRecord
  has_many :assignments
  has_many :toilets, through: :assignments
end
