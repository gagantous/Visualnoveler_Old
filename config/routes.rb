Rails.application.routes.draw do
  #move old urls to new site structure
  get 'pages/help',to: redirect('/help',status: 301)
  get 'pages/contact',to: redirect('/contact',status: 301)
  get 'pages/about', to: redirect('/about',status: 301)
  get 'pages/resources',to: redirect('/resources',status: 301)
  get 'pages/recommendation',to: redirect('/recommendation',status: 301)
  #get 'pages/blogs',to: redirect('/blogs',status: 301)
  get '/help' => 'pages#help'
  get '/contact' => 'pages#contact'
  get '/about' => 'pages#about'
  get '/about' => 'pages#about'
  get '/resources' => 'pages#resources'
  get '/recommendation' => 'pages#recommendation'
  #get '/blogs' => 'pages#blogs'
  root 'pages#home'
  post 'pages/subscribe' , :path => "subscribe"
  get 'search' => 'pages#search'
  get 'typeahead/:search' => 'pages#typeahead'
  get 'genres/typeahead/:search' => 'genres#typeahead'
  get 'developers/typeahead/:search' => 'developers#typeahead'

  get 'discourse/sso' => 'discourse_sso#sso'
  mount Starburst::Engine => "/starburst"

  #API routes
  scope :api do 
    get 'vns/search/:search' => 'api#vn'
  end
  #get 'api/vns/:search' => 'api#vn'


  resources :characters do
    get :search, on: :collection
  end
  resources :genres do
    get :search, on: :collection
    get :all, on: :collection
  end
  resources :franchises
  resources :publishers
  resources :contests do
    get :nominate, on: :member
    get :crop, on: :member
    post :nominate_update, on: :member
  end
  resources :developers do
    get :search, on: :collection
    get :all, on: :collection
  end
  resources :screenshots, except: [:index]
  resources :comments
  resources :library_entries, except: [:new]
  resources :posts

  namespace :admin do
    get 'vn'
    get 'vn_featured'
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
  end

  resources :vns do
    resources :reviews
    put :favourite, on: :member
    put :status, on: :member
    put :rate, on: :member
    get :walkthrough, on: :member
    get :edit_walkthrough, on: :member
    get :characters, on: :member
    get :crop, on: :member
    get :screenshots, on: :member
    get :simple_create, on: :collection
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
    member do
      get :watch
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
      put :update_avatar
    end
 end
  

  post 'vns/:id/favourite' => 'vns#favourite'
  post 'vns/:id/status' => 'vns#status'
  post 'vns/:id/rate' => 'vns#rate'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
