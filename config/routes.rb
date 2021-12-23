Rails.application.routes.draw do

  resource :users, only: [:index, :show, :create]
  post 'signin', to: "users#signin"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
