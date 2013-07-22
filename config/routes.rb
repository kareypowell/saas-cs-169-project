Myrottenpotatoes::Application.routes.draw do
  resources :movies
  root to: "movies#index"

  match 'auth/:provider/callback', to: 'sessions#create', as: 'login'
  match 'logout', to: 'sessions#destroy', as: 'logout'
  match 'auth/failure', to: redirect('/')
end