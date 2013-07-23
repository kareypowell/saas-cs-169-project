Myrottenpotatoes::Application.routes.draw do
  resources :movies do
  	resources :reviews
  end
  
  root to: "movies#index"

  match 'auth/:provider/callback', to: 'sessions#create', as: 'login'
  match 'logout', to: 'sessions#destroy', as: 'logout'
  match 'auth/failure', to: redirect('/')
end