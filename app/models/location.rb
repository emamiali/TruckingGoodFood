class Location < ApplicationRecord
  belongs_to :truck
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
