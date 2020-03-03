class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :date
      t.time :start_time
      t.integer :duration
      t.float :total_fee
      t.boolean :confirmed, default: false
      t.string :delivery_address
      t.boolean :delivery_included, default: false
      t.references :animal, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
