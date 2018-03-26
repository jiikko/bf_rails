Rails.application.routes.draw do
  root 'top#index'
  resources :prices, only: %i(index)
end
