Rails.application.routes.draw do
  root 'top#index'
  resources :charts, only: :index do
    get :day, on: :member
  end
  resources :prices, only: %i(index)
  resources :my_trades, only: %i(create) do
    member do
      put :cancel
    end
  end
  resources :my_trade_ships, only: %i(index)
  namespace :admin do
    resources :my_trades, only: %i(index) do
      delete :destroy_all, on: :collection
    end
  end
  resources :worker_statuses, only: %i(index)
  namespace :api do
    resource :disparities, only: :show
    post 'run_one_scalping' => 'scalpings#create', as: :run_one_scalping
    post 'run_endless_scalping' => 'daemon_scalpings#create', as: :run_endless_scalping
    post 'run_remove_waiting_trading' => 'remove_waiting_trades#create', as: :run_remove_waiting_trading
  end
  namespace :resque do
    resources :workers, only: %i(index)
    resources :jobs, only: %i(destroy), param: :pid
  end
  resources :scalping_tasks, only: %i(index)
  resource :setting, only: %i(edit update)
  resources :results, only: :index do
    post :recalc, on: :collection
  end
end
