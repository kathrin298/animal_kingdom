class Booking < ApplicationRecord
  belongs_to :animal
  belongs_to :user
  validates :date, :start_time, :duration, :total_fee, :animal, :user, presence: true
end
