Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get '/drinks', to: 'pages#drinks', as: 'drinks_page'
  get '/snacks', to: 'pages#snacks', as: 'snacks_page'

  get '/dashboard', to: 'admins#dashboard', as: 'dashboard_admins'

  root 'home#landing'
end
