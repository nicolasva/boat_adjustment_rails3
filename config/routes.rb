BoatAdjustmentRails3::Application.routes.draw do
  devise_for :users, :path => "users", :path_names => { :sign_in => "login", :sign_up => "new_user", :passwords => "users/passwords" }
  
  resources :translates

  namespace :common do
    resources :boat_types do
      resources :manufacturers
      resources :sellers
    end
  end

  namespace :mobile do
    scope do 
      match "/contexts/users/:firstname_id/crews" => "crews#index", :via => "GET"
      match "/contexts/users/:firstname_id/crews" => "crews#create", :via => "POST"
      match "/contexts/users/:firstname_id/crews/:id" => "crews#show", :via => "GET"
      match "/contexts/users/:firstname_id/crews/:id" => "crews#update", :via => "PUT"
      match "/contexts/users/:firstname_id/crews/:id" => "crews#destroy", :via => "DELETE"
      match "/contexts" => "contexts#create", :via => "POST"
    end


    resources :cities do
      resources :contexts do
        resources :daytimes
        resources :users, :as => "firstname" do
          resources :crews, :except => [:index, :create, :edit, :new, :show, :update, :destroy]
          resources :contexts_searchs
          resources :adjustment_types do
            resources :adjustments
          end
        end
      end
    end

    root :to => "cities#index"
  end

  namespace :computer do
    scope do
      #match "/computer/contexts/new" => "/computer/contexts/new", :via => "POST"
      match "contexts" => "contexts#create", :via => "POST"
      match "contexts" => "contexts#index"
    end
    resources :cities do
      resources :contexts do
        resources :daytimes
        resources :users, :as => "firstname" do
          resources :crews, :except => [:index, :create, :edit, :new, :show, :update, :destroy]
          resources :contexts_searchs
          resources :adjustment_types do
            resources :adjustments
          end
        end
      end
    end

    root :to => "cities#index"
  end

  #root :to => redirect("/users/login")
  root :to => "mobile/cities#index"
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
