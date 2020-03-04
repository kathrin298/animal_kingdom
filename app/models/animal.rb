class Animal < ApplicationRecord
  CATEGORIES = ['Birds', 'Mammals', 'Reptiles', 'Marine', 'Amphibians', 'Insects', 'Other']
  GENDERS = ['Male', 'Female']
  has_many :bookings
  has_many :reviews, through: :bookings
  belongs_to :user
  has_many_attached :photos
  validates :name, :species, :category, :gender, :user, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :gender, inclusion: { in: GENDERS }

  def average_rating
    if !reviews.empty?
      (reviews.sum(:rating).fdiv reviews.size).round(1)
    else
      "no reviews yet"
    end
  end
end
