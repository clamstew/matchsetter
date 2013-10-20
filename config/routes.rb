Matchsetter::Application.routes.draw do
  # NOTE: players probably doesn't need to be here 
  # the matches model will accept the POST for players
  resources :matches do
    resources :players, :only => [:create, :index, :new]
  end

  resources :courts

  resources :locations

  # for making new matches from clicking create match with a specific user
  get '/users/:id/matches/new', to: 'matches#new_solo', as: 'new_user_match'
  post '/users/:id/matches', to: 'matches#create_solo', as: 'user_matches'

  # root
  root :to => "home#index"

  # user stuff with devise
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users 
end