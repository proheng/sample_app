SampleApp::Application.routes.draw do

  resources :sessions, :only => [:new, :create, :destory] # restrict access to these three methods only

  resources :users
  resources :microposts, :only => [:create, :destory]
  
  root :to => 'pages#home'
# match '/', :to => "pages#home" # can user link_to 'name shown', home_path the namving convention is  controller_name#action
# match '/home', :to => "pages#home" # the namving convention is  controller_name#action
  match '/contact', :to => "pages#contact" # the namving convention is  controller_name#action
  match '/about',   :to => "pages#about"  # the namving convention is  controller_name#action
  match '/help',    :to => "pages#help" # the namving convention is  controller_name#action   
  match '/signup',  :to => "users#new" 

  match '/signin',  :to => "sessions#new"
  match '/signout',  :to => "sessions#destory"  

  get "pages/home"
  
  get "pages/contact" 
  
  get "pages/about"
  
  get "pages/help"
  
  
  # first created -> highest priority.
  # 
  #   The priority is based upon order of creation:
  #     match 'products/:id' => 'catalog#view'
  #   Keep in mind you can assign values other than :controller and :action
  #   Sample of regular route:
  #   Sample of named route:

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
