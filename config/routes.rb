Dinr::Application.routes.draw do
  root 'restaurants#index'
  resources :users, except: [:index]

  resource :session, only: [:create, :destroy]
  resources :restaurants, only: [:show, :index] do
    member do
      post "favorite"
      delete "unfavorite"
    end
  end

end
