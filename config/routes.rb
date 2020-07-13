Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
      resources :places, only: [:index, :show, :new, :create, :edit, :update, :destroy]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#show'
      patch '/favorite', to: 'places#update'
      delete '/delete', to: 'places#destroy'
      post '/get_places', to: 'fetches#get_places'
      post '/get_user_places', to: 'fetches#get_user_places'

    end
  end  
  
end

