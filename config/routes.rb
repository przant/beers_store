Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get '/drinks', to: 'pages#drinks', as: 'drinks_page'
  get '/snacks', to: 'pages#snacks', as: 'snacks_page'

  get '/dashboard', to: 'admins#dashboard', as: 'dashboard_admins'

  get '/admins/drinks/', to: 'admins/drinks#drinks', as: 'drinks_admins'
  get '/admins/drinks/new', to: 'admins/drinks#new_drink', as: 'new_drink_admins'
  post '/admins/drinks/new', to: 'admins/drinks#create_drink', as: 'create_drink_admins'
  get '/admins/drinks/:id', to: 'admins/drinks#drink', as: 'drink_admins'
  get '/admins/drinks/:id/edit', to: 'admins/drinks#edit_drink', as: 'edit_drink_admins'
  patch '/admins/drinks/:id/edit', to: 'admins/drinks#update_drink', as: 'update_drink_admins'
  delete '/admins/drinks/:id', to: 'admins/drinks#delete_drink', as: 'delete_drink_admins'

  get '/admin/snacks/', to: 'admins/snacks#snacks', as: 'snacks_admins'
  get '/snacks/new', to: 'admins/snacks#new_snack', as: 'new_snack_admins'
  post '/snacks/new', to: 'admins/snacks#create_snack', as: 'create_snack_admins'
  get '/admin/snacks/:id', to: 'admins/snacks#snack', as: 'snack_admins'
  get '/admin/snacks/:id/edit', to: 'admins/snacks#edit_snack', as: 'edit_snack_admins'
  patch '/admin/snacks/:id/edit', to: 'admins/snacks#update_snack', as: 'update_snack_admins'
  delete '/admin/snacks/:id', to: 'admins/snacks#delete_snack', as: 'delete_snack_admins'

  get '/admin/promos/', to: 'admins/promos#promos', as: 'promos_admins'
  get '/promotion/new', to: 'admins/promos#new_promo', as: 'new_promo_admins'
  post '/promotion/new', to: 'admins/promos#create_promo', as: 'create_promo_admins'
  get '/admin/promos/:id', to: 'admins/promos#promo', as: 'promo_admins'
  get '/admin/promos/:id/edit', to: 'admins/promos#edit_promo', as: 'edit_promo_admins'
  patch '/admin/promos/:id/edit', to: 'admins/promos#update_promo', as: 'update_promo_admins'
  delete '/admin/promos/:id', to: 'admins/promos#delete_promo', as: 'delete_promo_admins'

  root 'home#landing'
end
