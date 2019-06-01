Rails.application.routes.draw do
  get 'tasks/:filter', to: "tasks#index", as: 'filtered_tasks'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tasks#index'
end
