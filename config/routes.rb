Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  get '/recipes', to: 'recipes#index', as: 'recipes'
  get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  get '/recipes/new', to: 'recipes#new', as: 'recipe_new'

  
  delete '/recipes', to: 'recipes#destroy', as: 'recipe_delete'
  post '/recipes', to: 'recipes#create', as: 'recipe_create'
  
  get '/recipes/:id/ingredient', to: 'ingredients#new', as: 'recipe_ingredient_new'
  post '/recipes/:id', to: 'ingredients#create', as: 'recipe_ingredient_create'

  root 'home#index'
  resources :foods, only: [:index, :new , :create, :destroy]
  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
