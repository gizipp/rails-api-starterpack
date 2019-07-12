Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :prayers

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'users/list', to: 'users#list'
  get 'users/:id', to: 'users#show'
  put 'users', to: 'users#update'

end
