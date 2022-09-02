Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/new'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/myoffers', to: 'pages#myoffers'
  get '/mybookings', to: 'pages#mybookings'
  get '/aboutus', to: 'pages#aboutus'
  get '/contact', to: 'pages#contact'

  resources :users, only: %i[edit update show]
  resources :offers do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, except: %i[new create]
end
