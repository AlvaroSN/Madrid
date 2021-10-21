Rails.application.routes.draw do

  get 'news/front', to: "news#front"
  get "new/:id", to: "news#show", as: :oneNew
  get "news/plantilla"
  get 'players/index', to: "players#index"
  get "players/pruebas"
  get 'players/team', to: 'players#team'

  get 'players/teamSelected', :to => "searches#prueba", :as => "team"
  get 'devise/registrations/isAdmin', :to => "admins#index", :as => "checked"
  get 'devise/registrations/editProfile/:id' => 'admins#edit', :as => "edit_user_profiles"

  resources :news
  resources :players

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_scope :user do
    get "devise/registrations/all"=> "users/registrations#all", :as => "all"
    get 'devise/registrations/editProfile/:id' => 'admins#edit', :as => "edit_user_profile"
  end

  root to: "news#front"

end