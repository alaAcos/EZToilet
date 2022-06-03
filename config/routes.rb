Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :toilets do
    resources :bookings, only: %i[index create edit update] # new
    resources :features, only: %i[new create edit update]
  end
end
