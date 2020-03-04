class Animal < ApplicationRecord
  CATEGORIES = ['Birds', 'Mammals', 'Reptiles', 'Marine', 'Amphibians', 'Insects', 'Other']
  GENDERS = ['Male', 'Female']
  has_many :bookings
  belongs_to :user
  has_many_attached :photos
  validates :name, :species, :daily_rate, :category, :gender, :user, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :gender, inclusion: { in: GENDERS }

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
