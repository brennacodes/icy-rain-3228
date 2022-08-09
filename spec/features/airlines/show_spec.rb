require 'rails_helper'

RSpec.describe 'airlines show page', type: :feature do
  let!(:airline_1) { Airline.create(name: 'American Airlines') }
  let!(:flight_1) { Flight.create(number: 'AA1234', date: '08/03/20', departure_city: 'Denver', arrival_city: 'Reno', airline_id: airline_1.id) }
  let!(:flight_2) { Flight.create(number: 'AA1234', date: '11/22/33', departure_city: 'New York', arrival_city: 'Orlando', airline_id: airline_1.id) }
  let!(:flight_3) { Flight.create(number: 'AA4321', date: '04/14/24', departure_city: 'Boston', arrival_city: 'San Francisco', airline_id: airline_1.id) }
  let!(:flight_4) { Flight.create(number: 'AA5678', date: '05/15/25', departure_city: 'Chicago', arrival_city: 'New York', airline_id: airline_1.id) }
  let!(:passenger_1) { Passenger.create(name: 'John Doe', age: 30) }
  let!(:passenger_2) { Passenger.create(name: 'Gary Garrison', age: 20) }
  let!(:passenger_3) { Passenger.create(name: 'Willy Wonka', age: 70) }
  let!(:flights_passenger_1) { FlightsPassenger.create(flight_id: flight_1.id, passenger_id: passenger_1.id) }
  let!(:flights_passenger_2) { FlightsPassenger.create(flight_id: flight_1.id, passenger_id: passenger_2.id) }
  let!(:flights_passenger_3) { FlightsPassenger.create(flight_id: flight_2.id, passenger_id: passenger_3.id) }
  let!(:flights_passenger_4) { FlightsPassenger.create(flight_id: flight_2.id, passenger_id: passenger_1.id) }

  before do
    visit airline_path(airline_1)
  end

  # Then I see a list of passengers that have flights on that airline
  # And I see that this list is unique (no duplicate passengers)
  # And I see that this list only includes adult passengers
  it 'has a list of unique passengers that have flights on that airline' do
    within "#passengers" do
      expect(page).to have_content(passenger_1.name)
      expect(page).to have_content(passenger_2.name)

      expect(page).not_to have_content(passenger_3.name)

      expect(passenger_1.name).to appear(1).times
    end
  end

  it 'only shows adult passengers' do
    passenger_4 = Passenger.create(name: 'Jane Doe', age: 12)
    flights_passenger_5 = FlightsPassenger.create(flight_id: flight_1.id, passenger_id: passenger_4.id)

    within "#passengers" do
      expect(page).to have_content(passenger_1.name)
      expect(page).to have_content(passenger_2.name)
      expect(page).to have_content(passenger_3.name)

      expect(page).not_to have_content(passenger_4.name)
    end
  end

  it 'sorts list of passengers by number of flights each has taken on that airline' do
    passenger_4 = Passenger.create(name: 'Jane Doe', age: 40)
    flights_passenger_5 = FlightsPassenger.create(flight_id: flight_1.id, passenger_id: passenger_4.id)
    flights_passenger_6 = FlightsPassenger.create(flight_id: flight_2.id, passenger_id: passenger_2.id)
    flights_passenger_7 = FlightsPassenger.create(flight_id: flight_3.id, passenger_id: passenger_1.id)
    flights_passenger_8 = FlightsPassenger.create(flight_id: flight_3.id, passenger_id: passenger_2.id)
    flights_passenger_9 = FlightsPassenger.create(flight_id: flight_3.id, passenger_id: passenger_3.id)
    flights_passenger_10 = FlightsPassenger.create(flight_id: flight_4.id, passenger_id: passenger_1.id)

    within "#passengers" do
      expect(page).to have_content(passenger_1.name)
      expect(page).to have_content(passenger_2.name)
      expect(page).to have_content(passenger_3.name)
      expect(page).to have_content(passenger_4.name)

      expect(passenger_1.name).to appear_before(passenger_2.name)
      expect(passenger_2.name).to appear_before(passenger_3.name)
      expect(passenger_3.name).to appear_before(passenger_4.name)
    end
end