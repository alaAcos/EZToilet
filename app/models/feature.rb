class Feature < ApplicationRecord
  has_many :associations
  has_many :toilets, through: :associations
  accepts_nested_attributes_for :toilets
  attr_accessor :toilets_ids
end
