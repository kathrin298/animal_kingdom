class RemoveDateStartTimeAndDurationFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :date, :date
    remove_column :bookings, :start_time, :time
    remove_column :bookings, :duration, :integer
  end
end
