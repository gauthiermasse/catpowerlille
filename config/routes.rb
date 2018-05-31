Rails.application.routes.draw do
  
  
  resources :charges
  resources :items
  devise_for :users
  resources :items
  root 'home#index'
  get 'shop', to: 'home#shop', as: 'shop'
  get 'contact', to: 'home#contact', as: 'home_contact'
  get 'panier', to: 'home#panier', as: 'panier'
  post 'panier', to: 'home#pay'
  get 'profil', to: 'users#show', as: 'users_show'
  get 'add:id', to: 'home#add', as: 'add'
  get 'remove:id', to: 'home#remove', as:'remove'
  post 'pay', to: 'home#pay', as: 'pay'
  get 'orders', to: 'home#orders'
end
