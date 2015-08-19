Rails.application.routes.draw do

  devise_for :users

  root 'pages#home'

  controller :pages do
    get :about
    get :routes
    get :contact
  end

  resources :productions do

    resources :events do

      resources :instruments
      resources :devices

    end

  end

  namespace :admin do

    root 'dashboard#index'

    resources :users

  end

end
