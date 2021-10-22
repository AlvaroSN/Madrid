Rails.application.routes.draw do

  get 'news/front', to: "news#front"
  get "new/:id", to: "news#show", as: :oneNew
  get "news/plantilla"
  get 'players/index', to: "players#index"
  get "players/pruebas"
  get 'players/team', to: 'players#team'

  get 'players/teamSelected', :to => "searches#prueba", :as => "team"

  #get "admins/index"=> "admins#index", :as => "all"
  #get '/admins/:id/edit', :to => "admins#edit",:as => "editable"
  #patch '/admins/:id', :to => 'admins#edit', :as => "edit_user_profiles"

  get 'devise/registrations/isAdmin', :to => "admins#check", :as => "checked"

  resources :admins
  resources :news
  resources :players
  resources :teams do
    resources :users/registrations, shallow: true
  end

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_scope :user do

  end

  root to: "news#front"

end