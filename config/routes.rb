Rails.application.routes.draw do
  delete "/flights/:flight_id/passengers/:id", to: 'flights_passengers#destroy', as: 'remove_passenger'
  resources :airlines, only: [:show]
  resources :flights, only: [:index]
end
