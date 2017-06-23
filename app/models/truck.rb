class Truck < ApplicationRecord
  validates :truck_name, presence: true
  belongs_to :user
  has_many :menus
  has_many :locations 
end
