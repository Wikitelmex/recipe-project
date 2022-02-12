Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  get '/recipes', to: 'recipes#index', as: 'recipes'
  get '/recipes/new', to: 'recipes#new', as: 'recipe_new'
  get '/recipes/:id', to: 'recipes#show', as: 'recipe'

  
  delete '/recipes', to: 'recipes#destroy', as: 'recipe_delete'
  post '/recipes', to: 'recipes#create', as: 'recipe_create'
  
  get '/recipes/:id/ingredient', to: 'ingredients#new', as: 'recipe_ingredient_new'
  get '/recipes/:id/ingredients', to: 'ingredients#index', as: 'recipe_ingredient_shopping_list'
  post '/recipes/:id', to: 'ingredients#create', as: 'recipe_ingredient_create'
  get '/recipes/:id/ingredient/:ingredient_id/edit', to: 'ingredients#edit', as: 'recipe_ingredient_edit'
  patch '/recipes/:id/ingredient/:ingredient_id', to: 'ingredients#update', as: 'recipe_ingredient_update'
  delete '/recipes/:id/ingredient', to: 'ingredients#destroy', as: 'recipe_ingredient_delete'

  root 'home#index'
  resources :foods, only: [:index, :new , :create, :destroy]
  resources :recipe_foods, only: [:index] , path: 'general_shopping_list'
  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'
end
