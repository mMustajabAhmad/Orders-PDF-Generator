Rails.application.routes.draw do
  get 'restaurant_orders/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :catering_orders, only: [:index]
  resources :orders, only: [:show]
  resources :group_orders, only: [:show]
  resources :restaurants do
    resources :restaurant_orders, only: [:show]
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
