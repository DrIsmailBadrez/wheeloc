Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/myoffers', to: 'pages#myoffers'
  get '/aboutus', to: 'pages#aboutus'
  get '/contact', to: 'pages#contact'

  resources :users, only: %i[edit update show]
  resources :offers do

  end

end
