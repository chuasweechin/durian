Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'durians#index'

  # Routes for Durian
  # Index page (Durian)
  get '/durians' => 'durians#index', as: 'durians'

  # Create (C)
  get '/durians/new' => 'durians#new', as: 'new_durian'
  post '/durians' => 'durians#create'

  # Read (R)
  get '/durians/:id' => 'durians#show' , as: 'durian'


  # Update (U)
  get '/durians/:id/edit' => 'durians#edit', as: 'edit_durian'
  patch '/durians/:id' => 'durians#update'

  # Delete (D)
  delete '/durians/:id' => 'durians#destroy'



  # Routes for Order
  # Index page (Order)
  get '/orders' => 'orders#index', as: 'orders'

  # Create (C)
  post '/orders' => 'orders#create'

  # Read (R)
  get '/orders/:id' => 'orders#show' , as: 'order'

end