Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

get "players" => "players#index"
get "players/:id" => "players#show"
post "players" => "players#create"
patch "players/:id" => "players#update"
delete "players/:id" => "players#destroy"


get "games" => "games#index"
get "games/:id" => "games#show"
post "games" => "games#create"
patch "games/:id" => "games#update"
delete "games/:id" => "games#destroy"


namespace :api, defaults: {format: :json} do
  resources :games, only: [:create, :show, :update]

end
end
