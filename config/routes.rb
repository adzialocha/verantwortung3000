Rails.application.routes.draw do

  devise_for :users

  root 'pages#home'

  controller :pages do
    get :about
    get :routes
    get :contact
  end

  get 'calendar', controller: :calendar, to: :index
  get 'blackboard', controller: :black_board, to: :index
  get 'activity', controller: :activity, to: :index

  resources :users, :only => [ :show, :index ]
  resources :locations, :only => [ :show, :index ]

  resources :productions, :path => 'program' do
    resources :events
  end

  resources :instruments
  resources :devices

  namespace :admin do

    root 'dashboard#index'

    resources :users
    resources :locations

  end

end
