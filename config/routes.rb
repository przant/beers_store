Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get '/drinks', to: 'pages#drinks', as: 'drinks_page'
  get '/snacks', to: 'pages#snacks', as: 'snacks_page'

  get '/dashboard', to: 'admins#dashboard', as: 'dashboard_admins'
  get '/admin/drinks/', to: 'admins#drinks', as: 'drinks_admins'
  get '/admin/snacks/', to: 'admins#snacks', as: 'snacks_admins'
  get '/admin/promos/', to: 'admins#promos', as: 'promos_admins'

  get '/drinks/new', to: 'admins#new_drink', as: 'new_drink_admins'
  post '/drinks/new', to: 'admins#create_drink', as: 'create_drink_admins'

  get '/snacks/new', to: 'admins#new_snack', as: 'new_snack_admins'
  post '/snacks/new', to: 'admins#create_snack', as: 'create_snack_admins'

  get '/promotion/new', to: 'admins#new_promo', as: 'new_promo_admins'
  post '/promotion/new', to: 'admins#create_promo', as: 'create_promo_admins'

  get '/admin/drinks/:id', to: 'admins#drink', as: 'drink_admins'
  get '/admin/snacks/:id', to: 'admins#snack', as: 'snack_admins'
  get '/admin/promos/:id', to: 'admins#promo', as: 'promo_admins'

  get '/admin/drinks/:id/edit', to: 'admins#edit_drink', as: 'edit_drink_admins'
  patch '/admin/drinks/:id/edit', to: 'admins#update_drink', as: 'update_drink_admins'

  get '/admin/snacks/:id/edit', to: 'admins#edit_snack', as: 'edit_snack_admins'
  patch '/admin/snacks/:id/edit', to: 'admins#update_snack', as: 'update_snack_admins'

  get '/admin/promos/:id/edit', to: 'admins#edit_promo', as: 'edit_promo_admins'
  patch '/admin/promos/:id/edit', to: 'admins#update_promo', as: 'update_promo_admins'

  delete '/admin/drinks/:id', to: 'admins#delete_drink', as: 'delete_drink_admins'
  delete '/admin/snacks/:id', to: 'admins#delete_snack', as: 'delete_snack_admins'
  delete '/admin/promos/:id', to: 'admins#delete_promo', as: 'delete_promo_admins'

  root 'home#landing'
end
