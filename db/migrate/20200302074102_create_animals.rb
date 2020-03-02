class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :type
      t.string :name
      t.integer :age
      t.text :description
      t.string :gender
      t.string :category
      t.string :place_of_origin
      t.integer :hourly_rate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
