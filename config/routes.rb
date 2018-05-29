Rails.application.routes.draw do
  resources :items
  devise_for :users
  root 'home#index'
  get 'home/shop', to: 'home#shop'
  get 'home/contact'
  get 'home/panier', to: 'home#panier'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
