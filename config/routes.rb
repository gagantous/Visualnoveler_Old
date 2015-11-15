Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  root 'static_pages#home'
  post 'static_pages/subscribe' , :path => "subscribe"

  resources :characters
  resources :genres
  resources :library_entries, except: [:new, :edit]

  resources :vns do
    put :favourite, on: :member
    put :status, on: :member
    put :rate, on: :member
    get :characters, on: :member
  end
  # resources :users do
  #   get :watch, on: :member
  #   get :wishlist, on: :member
  #   get :drop, on: :member
  # end
  resources :users,only: [:show, :edit, :update] do
    member do
      get :watch
      get :wishlist
      get :drop
      get :completed
    end
 end
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  as :user do
    get "/login" => "devise/sessions#new"
    get "/register" => "devise/registrations#new"
    get "/edit" => "devise/registrations#edit"
    delete "/logout" => "devise/sessions#destroy"
  end

  post 'vns/:id/favourite' => 'vns#favourite'
  post 'vns/:id/status' => 'vns#status'


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
