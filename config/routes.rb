Rails.application.routes.draw do
  root 'top#index'
  resources :charts, only: :index do
    get :day, on: :member
  end
  resources :prices, only: %i(index)
  resources :my_trades, only: %i(index create) do
    member do
      put :cancel
    end
  end
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
  end
  namespace :resque do
    resources :workers, only: %i(index destroy)
  end
  resources :scalping_tasks, only: %i(index)
  resource :setting, only: %i(edit update)
  resources :results, only: :index do
    post :recalc, on: :collection
  end
end
