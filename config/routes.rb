Rails.application.routes.draw do
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'verify'  => 'sessions#verify_access_token'
  resources :users, only: [:show, :new, :edit, :create, :update, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  namespace :api do
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
    get    'verify'  => 'sessions#verify_access_token'
    resources :users, param: :access_token
    resources :password_resets, only: [:new, :create, :edit, :update]
  end

  get '/bills/all' => 'bills#allbills'
  post '/bills/new' => 'bills#create'


  root 'users#new'
end
