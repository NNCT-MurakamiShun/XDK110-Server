Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'

  mount Sidekiq::Web, at: '/sidekiq'

  namespace 'api' do
    resources :sensor_values, only: [:create] # due to reduce packet size
    resources :sensors, only: [] do
      resource :chart_setting, only: [:update]
      resources :sensor_values, only: [:index]
    end
  end

  resources :devices, only: [:index, :show, :create, :destroy] do
    resources :sensors, only: [:create, :update, :destroy]
  end

  root to: 'application#routing_error'
  match '*path', to: 'application#routing_error', via: :all

end
