Rails.application.routes.draw do
  root 'top#index'
  resources :prices, only: %i(index)
  resources :my_trades, only: %i(index create) do
    member do
      put :cancel
    end
  end
  resources :worker_statuses, only: %i(index)
  put 'toggle_fetch' => 'settings#toggle_fetch'
  namespace :resque do
    resources :workers, only: %i(index destroy)
  end
end
