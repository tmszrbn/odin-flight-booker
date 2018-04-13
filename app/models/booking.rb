class Booking < ApplicationRecord

    belongs_to :flight
    has_many :passengers

    # attr_accessor :passenger
    accepts_nested_attributes_for :passengers, reject_if: lambda {|attributes| attributes['name'].blank? || attributes['email'].blank?}

    def create_passengers passengers_attributes
        passengers_attributes.each do |p|
            self.passengers.create name: passengers_attributes[p]['name'], email: passengers_attributes[p]['email']
        end
    end
end