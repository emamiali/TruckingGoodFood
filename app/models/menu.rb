class Menu < ApplicationRecord
  has_many :trucks
  has_many :users
end
