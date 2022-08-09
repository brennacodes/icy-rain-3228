class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights
  has_many :flights_passengers, through: :passengers
end
