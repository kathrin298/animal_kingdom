class Animal < ApplicationRecord
  CATEGORIES = ['Birds', 'Mammals', 'Reptiles', 'Marine', 'Amphibians', 'Insects', 'Other']
  has_many :bookings
  belongs_to :user
  validates :name, :species, :hourly_rate, :category, :gender, :user, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
