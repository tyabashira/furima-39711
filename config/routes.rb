Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
   resources :items, only:  [:index, :new, :create, :show]
   resources :shoppings, only:  [:index, :create]
end

