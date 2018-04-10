Rails.application.routes.draw do
  root 'top#index'
  resources :prices, only: %i(index)
  resources :my_trades, only: %i(index create) do
    member do
      put :cancel
    end
  end
  resources :settings
  resources :worker_statuses, only: %i(index)
  put 'toggle_fetch' => 'settings#toggle_fetch'
end
