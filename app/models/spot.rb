class Spot < ApplicationRecord
  belongs_to :category
  has_many :reservations
  
  has_one_attached :thumbnail
  has_many_attached :detail_images
end
