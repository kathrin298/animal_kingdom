class Review < ApplicationRecord
  belongs_to :user
  validates :rating, presence: true
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }
  validates :rating, numericality: { only_integer: true }
  has_many :review, through :booking
end
