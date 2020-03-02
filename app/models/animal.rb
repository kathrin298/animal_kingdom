class Animal < ApplicationRecord
  CATEGORIES = ['Birds', 'Mammals', 'Reptiles', 'Marine', 'Amphibians', 'Insects', 'Other']
  belongs_to :user
  has_many_attached :photos
  validates :name, :species, :hourly_rate, :category, :gender, :user, presence: true
  # validates :category, inclusion: { in: CATEGORIES }
end
