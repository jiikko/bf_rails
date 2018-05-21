Rails.application.routes.draw do
  root 'top#index'
  resources :prices, only: %i(index)
  resources :my_trades, only: %i(index create) do
    member do
      put :cancel
    end
  end
  resources :worker_statuses, only: %i(index)
  namespace :api do
    resource :disparities, only: :show
  end
  namespace :resque do
    resources :workers, only: %i(index destroy)
  end
  post 'run_one_scalping' => 'scalpings#create', as: :run_one_scalping
  resources :scalping_tasks, only: %i(index)
  resource :setting, only: %i(edit update)
end
