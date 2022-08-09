require 'rails_helper'

RSpec.describe FlightsPassenger, type: :model do
  let!(:airline_1) { Airline.create(name: 'American Airlines') }
  let!(:flight_1) { Flight.create(number: 'AA1234', date: '08/03/20', departure_city: 'Denver', arrival_city: 'Reno', airline_id: airline_1.id) }
  let!(:flight_2) { Flight.create(number: 'AA1234', date: '11/22/33', departure_city: 'New York', arrival_city: 'Orlando', airline_id: airline_1.id) }
  let!(:passenger_1) { Passenger.create(name: 'John Doe', age: 33) }
  let!(:passenger_2) { Passenger.create(name: 'Gary Garrison', age: 22) }
  let!(:flights_passenger_1) { FlightsPassenger.create(flight_id: flight_1.id, passenger_id: passenger_1.id) }
  let!(:flights_passenger_2) { FlightsPassenger.create(flight_id: flight_1.id, passenger_id: passenger_2.id) }
  let!(:flights_passenger_3) { FlightsPassenger.create(flight_id: flight_2.id, passenger_id: passenger_2.id) }

  describe 'associations' do
    it { should belong_to :flight }
    it { should belong_to :passenger }
  end
  
  describe 'class methods' do
    it 'can locate a flights_passenger' do
      expect(FlightsPassenger.locate_passenger(flight_1.id, passenger_1.id)).to eq(flights_passenger_1)
    end
  end
end
