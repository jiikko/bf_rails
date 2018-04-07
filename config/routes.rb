Rails.application.routes.draw do
  root 'top#index'
  resources :prices, only: %i(index)
  resources :my_trades
  resources :settings
  put 'toggle_fetch' => 'settings#toggle_fetch'
end
