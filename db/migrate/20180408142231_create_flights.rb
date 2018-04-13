class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.references :to_airport#, foreign_key: true
      t.references :from_airport#, foreign_key: true
      t.datetime :take_off
      t.integer :duration
    end
  end
end
