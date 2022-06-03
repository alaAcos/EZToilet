class Association < ApplicationRecord
  attr_accessor :toilet_id, :feature_id

  belongs_to :toilet
  belongs_to :feature

  accepts_nested_attributes_for :toilet, :feature
end
