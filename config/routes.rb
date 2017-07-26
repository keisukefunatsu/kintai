Rails.application.routes.draw do
  get 'teachers', to: 'teachers#index'

  root to: 'users#index'
  resources :users
  resources :users do
    resources :in_dates
    resources :out_dates
  end

  get 'users/grade/:grade_id', to: 'users#index', as: 'users/grade'

  get 'teachers/grade/:grade_id', to: 'teachers#index', as: 'teachers/grade'

  get 'card_read', to: 'users#card_read', as: 'users/card_read'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
