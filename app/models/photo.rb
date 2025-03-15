# app/models/photo.rb
class Photo < ApplicationRecord
  has_one_attached :image

  validates :title, :category, presence: true
end
