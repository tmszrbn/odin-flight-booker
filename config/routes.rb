Rails.application.routes.draw do

  root 'flights#index'

  resources :bookings, only: [:new, :create, :show]
  # get 'bookings/new'
  # post 'bookings/create'
  # get 'bookings/show'
  resources :flights, only: [:index, :show]
  # get 'flights', to: 'flights#index'
  # get 'flights/:id', to: 'flights#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
