Rails.application.routes.draw do

  get 'news/front', to: "news#front"
  get 'players/index', to: "players#index"
  get "players/pruebas"
  get 'players/team', to: 'players#team'
  get "news", to: "news#index"
  get "new/:id", to: "news#show", as: :oneNew
  get "news/plantilla"

  get 'players/teamSelected', :to => "searches#prueba", :as => "team"

  resources :news
  resources :players
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  root to: "news#front"

end