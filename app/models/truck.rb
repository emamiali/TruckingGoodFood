class Truck < ApplicationRecord
  belongs_to :user
  has_many :menus
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
