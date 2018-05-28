Rails.application.routes.draw do
  root 'home#index'
  get 'home/shop'
  get 'home/contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
