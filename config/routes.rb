Rails.application.routes.draw do

  get 'news/front', to: "news#front"
  get "new/:id", to: "news#show", as: :oneNew
  get 'players/index', to: "players#index"
  get "players/pruebas"
  get 'players/team', to: 'players#team', :as => "teamPage"
  post 'players/team', to: 'players#updateTeam'
  post 'players/teamSeleceted', to: 'players#updateTeam'

  #Ruta para stimulus del formulario del equipo
  get 'players/teamSelected', :to => "searches#prueba", :as => "team"

  get 'admins/edit'=> 'admins#edit'
  post 'admins/:id/edit', :to => 'admins#update'
  #patch '/admins/:id', :to => 'admins#edit', :as => "edit_user_profiles"

  get 'devise/registrations/isAdmin', :to => "admins#check", :as => "checked"

  resources :admins
  resources :news
  resources :players

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_scope :user do

  end

  root to: "news#front"

end