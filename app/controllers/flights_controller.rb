class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |a| [a.code, a.id] }
    @passengers_count = [1, 2, 3, 4]
    if params[:commit] == 'Submit'
      year = params[:date][:year]
      month = params[:date][:month]
      day = params[:date][:day]
      @flights = Flight.search params[:from_airport],
                               params[:to_airport],
                               DateTime.parse("#{year}-#{month}-#{day}"),
                               params[:passengers_count]
    else
      @flights = []
    end
  end

  def show
  end
end
