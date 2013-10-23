Dinr::Application.routes.draw do
  root 'static#index'
  resources :users, except: [:index]

  resource :session, only: [:new, :create, :destroy]
  
  resources :restaurants, only: [:show, :index] do
    member do
      post "favorite"
      delete "unfavorite"
    end
  end

end
