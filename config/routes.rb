Rails.application.routes.draw do

  namespace :players do
    get 'searches/index'
  end

  get 'index', to: "news#front"
  get 'players/index', to: "players#index"
  get 'players/team'
  get "players/pruebas"
  #post "players/searches/index", to: "players/searches#index"
  get "news", to: "news#index"
  get "news/plantilla"

  resources :news
  resources :players
  devise_for :users

  #resources :players do
  #  collection do
  #    post :search, to: "players/searches#prueba"
  #  end
  #end

  root to: "news#front"

end