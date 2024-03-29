Loop::Application.routes.draw do
  resources :users do
    put 'update_password'
  end
  match '/dashboard'        => 'users#dashboard',       as: :dashboard
  match '/forgot_password'  => 'users#forgot_password', as: :forgot_password
  match '/reset_password'   => 'users#reset_password',  as: :reset_password
  
  resource  :user_session, controller: 'UserSession'
  match '/login'            => 'user_session#new',      as: :login
  match '/logout'           => 'user_session#destroy',  as: :logout

  # OAuth how you humor me so ...
  match '/auth/:provider/callback'  => 'user_session#create'
  match '/auth/failure'             => 'user_session#failure'


  resources :session, controller: 'api/session'
  root to: 'pages#index'
end
