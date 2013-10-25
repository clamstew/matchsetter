Matchsetter::Application.routes.draw do
  # NOTE: players probably doesn't need to be here 
  # the matches model will accept the POST for players
  resources :matches do
    resources :players, :only => [:create, :index, :new]
  end

  resources :courts

  # decided to keep in index but just put in the users matches
  # that they have scheduled
  resources :locations#, except: :index

  # for making new matches from clicking create match with a specific user
  get '/users/:id/matches/new', to: 'matches#new_solo', as: 'new_user_match'
  post '/users/:id/matches', to: 'matches#create_solo', as: 'user_matches'

  # root and static pages
  root :to => "home#index"
  get '/about', to: "home#about", as: "about"

  # user stuff with devise
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users 

  get 'users/:id/availability/set', to: 'availability_slots#new', as: 'availability_new'
  # post 'users/:id/availability/create', to: 'availability_slots#create', as: 'availability_create'
  post 'users/:id/availability', to: 'availability_slots#create', as: 'availability_create'
  get 'users/:id/availability', to: 'availability_slots#index', as: 'availability_index'
end