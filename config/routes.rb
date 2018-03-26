Rails.application.routes.draw do
  root 'top#index'
  resources :prices, only: %i(index)
  resources :settings
  put 'toggle_fetch' => 'settings#toggle_fetch'
end
