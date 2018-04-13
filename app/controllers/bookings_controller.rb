class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    params[:passengers_count].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create flight_id: params[:flight][:id].to_i
    @booking.create_passengers params[:booking][:passengers_attributes]
    redirect_to @booking
  end

  def show
    @booking = Booking.find params[:id]
    @passengers = @booking.passengers
  end
end
