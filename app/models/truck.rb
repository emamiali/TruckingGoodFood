class Truck < ApplicationRecord
  validates :truck_name, presence: true
  belongs_to :user
  has_many :menus
  has_many :locations

  has_attached_file :truck_image,
                    styles: { :large => "600x400>",
                              :medium => "300x200>",
                              :small => "100x75>",
                              :thumb => "60x42>" },
                    :default_url => "/assets/avatar.png"

  validates_attachment_content_type :truck_image, content_type: /\Aimage\/.*\z/
end
