class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights
  has_many :flights_passengers, through: :passengers

  def adult_passengers
    passengers.adults.uniq
  end

  def sort_passengers_by_number_of_flights
    passengers.adults.group('passengers.id').order('count(flights_passengers.passenger_id) DESC')
  end
end
