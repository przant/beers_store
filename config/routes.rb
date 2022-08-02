Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get '/drinks', to: 'pages#drinks', as: 'drinks_page'
  get '/snacks', to: 'pages#snacks', as: 'snacks_page'

  get '/dashboard', to: 'admins#dashboard', as: 'dashboard_admins'
  get '/admin/drinks/', to: 'admins#drinks', as: 'drinks_admins'

  get '/drinks/new', to: 'admins#new_drink', as: 'new_drink_admins'
  post '/drinks/new', to: 'admins#create_drink', as: 'create_drink_admins'

  get '/snacks/new', to: 'admins#new_snack', as: 'new_snack_admins'
  post '/snacks/new', to: 'admins#create_snack', as: 'create_snack_admins'

  get '/promotion/new', to: 'admins#new_promo', as: 'new_promo_admins'
  post '/promotion/new', to: 'admins#create_promo', as: 'create_promo_admins'

  root 'home#landing'
end
