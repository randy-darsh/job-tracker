Rails.application.routes.draw do

  root 'companies#index'

  resources :companies do
    resources :contacts, only: [:create]
    resources :jobs do
      resources :comments, only: [:create]
    end
  end

  resources :categories

  get '/jobs', to: "jobs#sort", as: "sort"
  get 'dashboard', to: 'jobs#dashboard', as: "dashboard"
end
