Dinr::Application.routes.draw do
  root 'static#index'
  resources :users, except: [:index]
  resource :session, only: [:new, :create, :destroy]
  resources :favorites, only: [:new, :show, :edit, :update, :destroy]
  resources :restaurant, only: [:show, :index]
end
