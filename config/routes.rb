Rails.application.routes.draw do
  get 'esquemas/index'

  get 'esquemas/show'

  get 'esquemas/edit'

  get 'esquemas/delete'

  get 'esquemas/new'

  root 'servidores#list'
  get 'databases/list'
  get 'databases/delete'
  get 'net_validations/index'
  get 'servidores/list'
  get 'servidores/delete'
  get 'databases/new'
  get 'esquemas/new'
  resources :servidores do
    collection do
      get :list
    end
    member do
      get :delete
    end
  end
  
  resources :databases do
    member do
      get :delete
    end
  end
  
  resources :configurations
  
  resources :esquemas do
    member do
      get :delete
    end
  end
  
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
  #match ':controller(/:action(/:id(.:format)))'
end
