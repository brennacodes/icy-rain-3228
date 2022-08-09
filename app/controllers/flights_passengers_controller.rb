class FlightsPassengersController < ApplicationController
  def destroy
    passenger = PassengersFlight.locate_passenger(params[:id], params[:passenger_id])
    passenger.destroy
    redirect_to flights_url
  end
end