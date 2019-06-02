Rails.application.routes.draw do
  devise_for :users

  get 'tasks/:filter', to: "tasks#index", as: 'filtered_tasks'

  resources :tasks, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tasks#index'
end
