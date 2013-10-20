Matchsetter::Application.routes.draw do
  resources :matches do
    resources :players, :only => [:create, :index, :new]
  end

  resources :courts

  resources :locations

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end