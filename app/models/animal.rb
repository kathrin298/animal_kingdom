class Animal < ApplicationRecord
  CATEGORIES = ['Birds', 'Mammals', 'Reptiles', 'Marine', 'Amphibians', 'Insects', 'Other']
  belongs_to :user
  has_one_attached :photo
  validates :name, :species, :hourly_rate, :category, :gender, :user, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
