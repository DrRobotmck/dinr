Dinr::Application.routes.draw do
  root 'static#index'
  resources :users, except: [:index] do
    # resources :favorites, only: [:index, :destroy]
  end
  resource :session, only: [:new, :create, :destroy]
  
  resources :restaurants, only: [:show, :index]
end
