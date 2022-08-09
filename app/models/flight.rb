class Flight < ApplicationRecord
  belongs_to :airline
  has_many :flights_passengers
  has_many :passengers, through: :flights_passengers
end
