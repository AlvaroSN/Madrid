Rails.application.routes.draw do

  get 'news/front', to: "news#front"
  get 'players/index', to: "players#index"
  get "players/pruebas"
  get 'players/team'
  get "news", to: "news#index"
  get "news/plantilla"

  get 'players/teamSelected', :to => "searches#prueba", :as => "team"

  resources :news
  resources :players
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  #resources :players do
  #  collection do
  #    get :team, to: "searches#prueba"
  #  end
  #end

  root to: "news#front"

end