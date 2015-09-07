Rails.application.routes.draw do

  devise_for :users

  root 'pages#home'

  controller :pages do
    get :about
    get :routes
    get :contact
  end

  get 'blackboard', controller: :black_board, to: :index

  resources :users, :only => [ :show, :index ]

  resources :productions do
    resources :events
  end

  resources :instruments
  resources :devices

  namespace :admin do

    root 'dashboard#index'

    resources :users

  end

end
