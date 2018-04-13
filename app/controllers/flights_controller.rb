class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |a| [a.code, a.id] }
    @passengers_count = [1, 2, 3, 4]
    if params[:commit] == 'Submit'
      @flights = Flight.search params[:from_airport],
                               params[:to_airport], 
                               DateTime.parse("#{params[:date][:year]}-#{params[:date][:month]}-#{params[:date][:day]}"),
                               params[:passengers_count]
    else
      @flights = []
    end
  end

  def show
  end
end
