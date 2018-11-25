Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'accounts#home'
  # get 'pages/home', to: 'pages#home'
  resources :accounts

end
