class ChangeHourlyRateColumnNameToDailyRate < ActiveRecord::Migration[5.2]
  def change
    rename_column :animals, :hourly_rate, :daily_rate
  end
end
