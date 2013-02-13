EvadesWebSite::Application.routes.draw do



  resources :mailings, :except => :new


  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

  mount Ckeditor::Engine => '/ckeditor'

  match 'pages/home', :to => 'pages#home', :as => :home_page
  match 'pages/contact', :to => 'pages#contact', :as => :contact_page
  match 'pages/principe', :to => 'pages#principe', :as => :principe_page
  match 'pages/galerie', :to => 'pages#galerie', :as => :galerie_page

  resources :affiche_templates do
    get "showFond", :on => :member
  end


  get "photos/index"  
  match "/photos/" => "photos#index", :as => :photos
  match "/photos/:id" => "photos#show", :as => :show_photos


  resources :lieus, :as => :lieus


  resources :spectacles


  resources :users, :as => :users

mount Ckeditor::Engine => "/ckeditor"

  root :to => "pages#home"

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
  # match ':controller(/:action(/:id))(.:format)'
end
