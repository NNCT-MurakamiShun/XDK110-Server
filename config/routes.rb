Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    resources :devices, only: [] do
      resources :sensors, only: [:show, :create, :update, :destroy] do
        resources :sensor_values, only: [:create]
      end
    end
  end

  resources :devices

end
