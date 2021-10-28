Rails.application.routes.draw do

  get 'news/front', to: "news#front"
  get "new/:id", to: "news#show", as: :oneNew
  get 'players/index', to: "players#index"
  get "players/pruebas"
  get 'players/team', to: 'players#team', :as => "teamPage"
  post 'players/team', to: 'players#updateTeam'
  post 'players/teamSeleceted', to: 'players#updateTeam'
  get 'players/userTeam/:id', to: 'players#userTeam', as: 'userTeam'

  get 'admins/edit'=> 'admins#edit'
  post 'admins/:id/edit', :to => 'admins#update'

  #Rutas para Stimulus
  get 'players/teamSelected', :to => "players#searches", :as => "team"
  get 'devise/registrations/isAdmin', :to => "admins#check", :as => "checked"
  get 'devise/registrations/isDel', :to => "admins#check2", :as => "del"

  resources :admins
  resources :news
  resources :players

  devise_for :users, :controllers => { registrations: 'users/registrations' }

  root to: "news#front"

end