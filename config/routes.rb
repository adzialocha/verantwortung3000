Rails.application.routes.draw do

  devise_for :users

  root 'pages#home'

  controller :pages do
    get :about
    get :routes
    get :contact
  end

  resources :users, :only => :show

  resources :productions do

    resources :events do

      resources :collaborations
      resources :requirements

    end

  end

  namespace :admin do

    root 'dashboard#index'

    resources :users

  end

end
