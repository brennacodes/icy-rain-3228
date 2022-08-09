class FlightsPassengersController < ApplicationController
  def destroy
    passenger = FlightsPassenger.locate_passenger(params[:flight_id], params[:id])
    passenger.destroy
    redirect_to flights_url
  end
end