Rails.application.routes.draw do
  get '/help' => 'pages#help'
  get '/faq' => 'pages#faq'
  get '/contact' => 'pages#contact'
  get '/about' => 'pages#about'
  get '/resources' => 'pages#resources'
  get '/recommendation' => 'pages#recommendation'
  get '/blogs' => 'pages#blogs'
  
  authenticated :user do
    root :to => "pages#dashboard",as: :authenticated_root
  end
  root :to => 'pages#home'

  post 'pages/subscribe' , :path => "subscribe"
  get 'search' => 'pages#search'
  get 'typeahead/:search' => 'pages#typeahead'
  get 'genres/typeahead/:search' => 'genres#typeahead'
  get 'developers/typeahead/:search' => 'developers#typeahead'
  get 'users/typeahead/:search' => 'users#typeahead'
  post 'twitter_register' => 'users#twitter_register'
  get 'discourse/sso' => 'discourse_sso#sso'
  mount Starburst::Engine => "/starburst"

  #API routes
  scope :api do 
    get 'vns/search/:search' => 'api#vn'
    get 'vns/typeahead/:search' => 'api#vn_typeahead'
  end
  #get 'api/vns/:search' => 'api#vn'

  resources :characters do
    get :search, on: :collection
  end
  resources :genres do
    get :search, on: :collection
    get :all, on: :collection
  end

  resources :developers do
    get :search, on: :collection
    get :all, on: :collection
  end

  resources :franchises
  resources :publishers
  resources :news
  resources :translations
  resources :tags,only: [:index,:show]
  resources :news_images
  resources :screenshots, except: [:index]
  resources :comments
  resources :library_entries, except: [:new]
  resources :translation_posts, except: [:index,:show]
  resources :posts

  namespace :admin do
    get 'vn'
    get 'vn_featured'
    get 'vn_no_walkthrough'
    get 'vn_no_review'
    get 'vn_not_featured'
    get 'vn_no_screenshot'
    get 'vn_other_nil'
    get 'genre'
    get 'developer'
    get 'users'
    get 'character'
    get 'publisher'
    get 'lonely_character'
    post 'delete_lonely_character'
    get 'screenshot'
    get 'review'
    get 'franchise'
    get 'translation'
  end

  resources :vns do
    resources :reviews
    put :favourite, on: :member
    put :status, on: :member
    put :rate, on: :member
    get :walkthrough, on: :member
    get :edit_walkthrough, on: :member
    get :edit_translation, on: :member
    get :translation, on: :member
    get :characters, on: :member
    get :crop, on: :member
    get :screenshots, on: :member
    get :top, on: :collection
    get :translated, on: :collection
    get :walkthroughs, on: :collection
    get :discover, on: :collection
    get :search, on: :collection
  end
  # resources :users do
  #   get :watch, on: :member
  #   get :wishlist, on: :member
  #   get :drop, on: :member
  # end

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks",:registrations => :registrations,:passwords => "passwords",confirmations: 'confirmations' }
  as :user do
    get "/login" => "devise/sessions#new"
    get "/register" => "devise/registrations#new"
    get "/edit" => "devise/registrations#edit"
    delete "/logout" => "devise/sessions#destroy"
  end

    resources :users,only: [:show,:index,:update,:edit] do 
      get :search, on: :collection
      member do
        get :watch
        get :reviews
        get :library
        get :wishlist
        get :drop
        get :favourite
        get :completed
        get :crop
        get :similar
        get :discover
        get :change_password
        get :setup
        post :update_header
        get :crop
      end
 end
  
  #anime studio sim
  get '/anime-studio-sim' => 'anime_sim#home'
  get '/anime-studio-sim/about' => 'anime_sim#about'
  get '/anime-studio-sim/story' => 'anime_sim#story'
  get '/anime-studio-sim/characters' => 'anime_sim#characters'
  get '/anime-studio-sim/gallery' => 'anime_sim#gallery'
  get '/anime-studio-sim/presskit' => 'anime_sim#press'
  #ascendant hearts
  get '/ascendant-hearts' => 'ascendant_hearts#home'
  get '/ascendant-hearts/presskit' => 'ascendant_hearts#press'
  #destiny chronicles
  get '/destiny-chronicles' => 'destiny_chronicles#home'
  #rat simulator
  get '/rat-simulator' => 'rat_simulator#home'
  get '/rat-simulator/presskit' => 'rat_simulator#press'

  post 'vns/:id/favourite' => 'vns#favourite'
  post 'vns/:id/status' => 'vns#status'
  post 'vns/:id/rate' => 'vns#rate'

end
