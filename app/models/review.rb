class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :rating, presence: true
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }
  validates :rating, numericality: { only_integer: true }
end
