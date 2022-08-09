class FlightsPassenger < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger

  def self.locate_passenger(flight_id, passenger_id)
    FlightsPassenger.where(flight_id: flight_id, passenger_id: passenger_id).first
  end
end
