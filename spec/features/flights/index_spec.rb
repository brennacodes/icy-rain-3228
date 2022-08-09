require 'rails_helper'

RSpec.describe 'flights index page', type: :feature do
  let!(:airline_1) { Airline.create(name: 'American Airlines') }
  let!(:airline_2) { Airline.create(name: 'United Airlines') }
  let!(:flight_1) { Flight.create(number: 'AA1234', date: '08/03/20', departure_city: 'Denver', arrival_city: 'Reno', airline_id: airline_1.id) }
  let!(:flight_2) { Flight.create(number: 'UA1234', date: '11/22/33', departure_city: 'New York', arrival_city: 'Orlando', airline_id: airline_2.id) }
  let!(:passenger_1) { Passenger.create(name: 'John Doe', age: 30) }
  let!(:passenger_2) { Passenger.create(name: 'Gary Garrison', age: 20) }
  let!(:passenger_3) { Passenger.create(name: 'Willy Wonka', age: 70) }
  let!(:flights_passenger_1) { FlightsPassenger.create(flight_id: flight_1.id, passenger_id: passenger_1.id) }
  let!(:flights_passenger_2) { FlightsPassenger.create(flight_id: flight_1.id, passenger_id: passenger_2.id) }
  let!(:flights_passenger_3) { FlightsPassenger.create(flight_id: flight_2.id, passenger_id: passenger_3.id) }

  it 'lists all flight numbers' do
    expect(page).to have_content(flight_1.number)
    expect(page).to have_content(flight_2.number)
  end

  it "lists the airline next to each flight number" do
    within "#airline-#{airline_1.id}" do
      expect(page).to have_content(flight_1.number)
      expect(page).to have_content(airline_1.name)

      expect(flight_1.number).to appear_before(airline_1.name)
    end
  end

  it "lists the names of the flights passengers" do
    within "#flight_#{flight_1.id}" do
      expect(page).to have_content(passenger_1.name)
      expect(page).to have_content(passenger_2.name)
      expect(page).to have_content(passenger_3.name)
    end
  end

  it "has a link next to each passenger name to remove that passenger from that flight" do
    within "#flight_#{flight_1.id}" do
      expect(page).to have_link("Remove #{passenger_1.name}")
      expect(page).to have_link("Remove #{passenger_2.name}")
      expect(page).not_to have_link("Remove #{passenger_3.name}")
    end
  end

  it "removes a passenger from a flight" do
    within "#passenger_#{passenger_1.id}" do
      click_link "Remove #{passenger_1.name}"
    end
      expect(current_path).to eq(flights_path)

      expect(page).to have_content(passenger_2.name)
      expect(page).not_to have_content(passenger_1.name)
  end

  it "does not destroy the passeenger record entirely" do
    within "#passenger_#{passenger_1.id}" do
      click_link "Remove #{passenger_1.name}"
    end
      expect(current_path).to eq(flights_path)

      expect(page).to have_content(passenger_2.name)
      expect(page).not_to have_content(passenger_1.name)

      expect(Passenger.find(passenger_1.id)).to exist
  end
end