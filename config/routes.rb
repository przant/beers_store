Rails.application.routes.draw do
  get '/drinks', to: 'pages#drinks', as: 'drinks_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#landing'
end
