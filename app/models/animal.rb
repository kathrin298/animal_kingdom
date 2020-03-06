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


  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  def average_rating
    if !reviews.empty?
      (reviews.sum(:rating) / reviews.size.to_f).round(1)
    else
      "no reviews yet"
    end
  end

  def get_category
    if self.category != 'Marine' && self.category != 'Other'
      self.category[0..-2]
    else
      self.category
    end

  end
end
