Matchsetter::Application.routes.draw do
  resources :matches

  resources :courts

  resources :locations

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end