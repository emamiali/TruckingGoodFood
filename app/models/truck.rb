class Truck < ApplicationRecord
  validates :truck_name, presence: true
  belongs_to :user
  has_many :menus
  has_many :locations 
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
