Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    resources :sensor_values, only: [:create] # due to reduce packet size
    resources :devices, only: [] do
      resources :sensors, only: [] do
        resources :sensor_values, only: [:index]
      end
    end
  end

  resources :devices, only: [:index, :show, :create, :destroy] do
    resources :sensors, only: [:create, :update, :destroy]
  end

  root to: 'application#routing_error'
  match '*path', to: 'application#routing_error', via: :all

end
