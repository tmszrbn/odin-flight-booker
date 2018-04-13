class Flight < ApplicationRecord
    belongs_to :to_airport, class_name: "Airport", foreign_key: "to_airport_id"
    belongs_to :from_airport, class_name: "Airport", foreign_key: "from_airport_id"
    has_many :bookings
    has_many :passengers, through: :bookings

    def self.search from_airport, to_airport, date, passengers_count
        Flight.where(from_airport_id: from_airport, to_airport_id: to_airport, take_off: date).where(["seats_left >= ?", passengers_count])
    end
end
