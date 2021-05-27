Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do

      resources :users
      resources :trips
      resources :bucketlist_items
      post "/login", to: "auth#login"
      get "/auto_login", to: "auth#auto_login"
      get "/profile", to: "users#profile"
    end
  end
end
