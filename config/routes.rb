Rails.application.routes.draw do

  devise_for :users

  root 'pages#home'

  controller :pages do
    get :about
    get :routes
    get :contact
  end

  resources :productions

  namespace :admin do

    root 'dashboard#index'

    resources :users

  end

end
