Rails.application.routes.draw do
  resources :line_items
  resources :carts
  get 'gallery/index'
  get 'gallery/checkout'
  post 'gallery/checkout'
  get 'gallery/purchase_complete'
  get 'gallery/search'
  post 'gallery/search'
  resources :stores
  get 'admin/login'
  post 'admin/login'
  get 'admin/logout'
  devise_for :users
  
  get 'home/index'
  get 'home/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
