Rails.application.routes.draw do
  
  resources :items
  devise_for :users
  root 'home#index'
  get 'home/shop', to: 'home#shop'
  get 'home/contact'
  get 'home/panier', to: 'home#panier'
  get 'users/show'

end
