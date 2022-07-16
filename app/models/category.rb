class Category < ApplicationRecord
  has_many :spots
  
  has_one_attached :icon
end
