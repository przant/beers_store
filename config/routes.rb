Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get '/drinks', to: 'pages#drinks', as: 'drinks_page'
  get '/snacks', to: 'pages#snacks', as: 'snacks_page'

  root 'home#landing'
end
