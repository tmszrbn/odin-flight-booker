class AddSeatsLeftToFlight < ActiveRecord::Migration[5.1]
  def change
    add_column :flights, :seats_left, :integer
  end
end
