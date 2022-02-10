Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root 'home#index'
  resources :foods, only: [:index, :new , :create, :destroy]
  resources :recipe_foods, only: [:index] , path: 'general_shopping_list'
  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
