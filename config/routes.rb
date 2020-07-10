Rails.application.routes.draw do
  resources :managers
  resources :repair_requests
  resources :product_exchanges
  resources :repair_shops
  resources :musicians
  resources :products
  resources :gc_branches
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/signup" => "managers#new"
  post "/managers" => "managers#create"
end
