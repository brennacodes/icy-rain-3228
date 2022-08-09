class Passenger < ApplicationRecord
  has_many :flights_passengers
  has_many :flights, through: :flights_passengers
  has_many :airlines, through: :flights

  scope :adults, -> { where('age >= ?', 18) }
end
