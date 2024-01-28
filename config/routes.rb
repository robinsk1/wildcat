Rails.application.routes.draw do
  get 'map/show'

  resources :wildcat_priority_areas, only: %i[show] do 
    get :contains, on: :collection
    get :within, on: :collection
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "map#show"
end
