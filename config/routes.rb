QuanLyCongVan::Application.routes.draw do
 
  
  get 'hocbongs/:id/export_hocbongs', :controller=>:hocbongs, :action=>:export_hocbongs
  resources :thongtinthuctaps

  get "sessions/new"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "administrator/users" => "users#index", :as => "administrator/users"
  get "signup" => "users#new", :as => "signup"
  root :to => "trangchu#index"
  resources :users
  resources :sessions
  resources :password_resets
  
  get "chitiet/chitiet"
  get "hocbongs/search"
  get "/baoluus/search"
  get "/buocthoihocs/search"
  get "/ngoaitrus/search"
  get "/noitrus/search"
  get "/trocaps/search"
  resources :diemrenluyens

  resources :trocaps

  resources :buocthoihocs

  resources :baoluus

  resources :noitrus

  resources :ngoaitrus

  resources :chitiethocbongs

  resources :hocbongs

  get 'extra_search' => 'extra_search#index'
  get 'svsearch' => 'svsearch#index'
  #get "extra_search/index"
  get "congvans/extra_search"
  get "congvans/search"
  get "giangviens/search"
  get "hocbongs/search"
  get "baoluus/search"
  get "buocthoihocs/search"
  get "diemrenluyens/search"
  get "ngoaitrus/search"
  get "noitrus/search"
  get "trocaps/search"
  get "covanhoctaps/search"
  get "layouts/extra_search"
 
  resources :congvans
  
  #get "admin/index"
  get 'admin' => 'admin#index'
  controller :sessions do
  get 'login' => :new
  post 'login' => :create
  delete 'logout' => :destroy
  end
  #get "sessions/new"

  get "sessions/create"

  #get "sessions/destroy"
  get "admin/index"
  get "giangviens/index"
  get "sinhviens/index"
  get "chucvus/new"
  get"hocvis/new"
  get"ngaches/new"
  get"covanhoctaps/index"
  get "trangchu/application"

  get"sinhviens/search"
  resources:chucvus
  resources:ngaches
  resources:trangchu
  resources :giangviens
  
  resources :sinhviens
  resources :users
  resources :hocvis
  resources :covanhoctaps
  
  get "trangchu/index"
  
  
  resource :congvans do
    collection do
      get 'view'
      get 'data'
    end
  end
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
   match ':controller(/:action(/:id))(.:format)'
end
