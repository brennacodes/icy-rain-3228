class CreateFlightsPassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :flights_passengers do |t|
      t.references :flight, foreign_key: true
      t.references :passenger, foreign_key: true

      t.timestamps
    end
  end
end
