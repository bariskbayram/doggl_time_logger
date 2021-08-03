Rails.application.routes.draw do
  resources :types
  resources :entries
  root 'sessions#new'
  get 'signup', to: 'registrations#new'
  post 'signup', to: 'registrations#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'report', to: 'users#index'
  post 'report', to: 'users#report'
  get 'criteria', to: 'entries#index'
  post 'criteria', to: 'entries#criteria'
end