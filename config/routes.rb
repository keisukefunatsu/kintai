Rails.application.routes.draw do
  get 'teachers', to: 'teachers#index'

  root to: 'users#index'
  resources :users
  resources :users do
    resources :in_dates
    resources :out_dates
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
