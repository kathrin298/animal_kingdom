class AddDefaultOfFalseToBooleanFields < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :confirmed, :boolean, default: false
    change_column :bookings, :delivery_included, :boolean, default: false
  end
end
