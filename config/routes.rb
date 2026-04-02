Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :auth, only: [:create]
  get "up" => "rails/health#show", as: :rails_health_check

  resources :coffee_shops do
    collection do
      get :nearest
    end
  end
end
