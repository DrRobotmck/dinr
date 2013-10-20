Dinr::Application.routes.draw do
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resource :session, only: [:new, :create, :destroy]
  resources :favorites, only: [:new, :show, :edit, :update, :destroy]
  resources :restaurant, only: [:show]
end
