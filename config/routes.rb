Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'workouts#index'

  get 'workouts/random', to: 'workouts#random'

  resources :workouts do
    resources :attempts
  end

  get 'workouts/random', to: 'workouts#random'
  # Defines the root path route ("/")
  # root "articles#index"
end
