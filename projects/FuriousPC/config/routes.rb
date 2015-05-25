Rails.application.routes.draw do


  
  get 'catalog/show'
  get 'catalog/show/:id' => 'catalog#show'
  get 'catalog/index'
  get 'catalog/latest'

  namespace :admin do
  get 'provider/new'
  end

  namespace :admin do
  get 'provider/create'
  post 'provider/create'
  end

  namespace :admin do
  get 'provider/edit'
  end

  namespace :admin do
  get 'provider/update'
  post 'provider/update'
  end

  namespace :admin do
  get 'provider/destroy'
  post 'provider/destroy'
  end

  namespace :admin do
  get 'provider/show'
  end

  namespace :admin do
  get 'provider/index'
  end

  namespace :admin do
  get 'providers/new'
  end

  namespace :admin do
  get 'providers/create'
  post 'providers/create'
  end

  namespace :admin do
  get 'providers/index'
  end

  namespace :admin do
  get 'providers/show'
  end

  namespace :admin do
  get 'providers/edit'
  end

  namespace :admin do
  get 'providers/update'
  post 'providers/update'
  end

  namespace :admin do
  get 'providers/destroy'
  post 'providers/destroy'
  end

  namespace :admin do
  get 'item/new'
  post 'item/new'
  end

  namespace :admin do
  post 'item/create'
  end

  namespace :admin do
  get 'item/edit'
  end

  namespace :admin do
  post 'item/update'
  end

  namespace :admin do
  get 'item/destroy'
  post 'item/destroy'
  end

  namespace :admin do
  get 'item/show'
  end

  namespace :admin do
  get 'item/index'
  end

  namespace :admin do
  get 'item/choosetype'
  post 'item/choosetype'
  end

  namespace :admin do
  get 'customer/new'
  end

  namespace :admin do
  get 'customer/create'
  post 'customer/create'
  end

  namespace :admin do
  get 'customer/edit'
  end

  namespace :admin do
  get 'customer/update'
  post 'customer/update'
  end

  namespace :admin do
  get 'customer/destroy'
  post 'customer/destroy'
  end

  namespace :admin do
  get 'customer/show'
  end

  namespace :admin do
  get 'customer/index'
  end

  get 'admin/customer'

  namespace :admin do
  get 'manufacturer/new'
  end

  namespace :admin do
  get 'manufacturer/create'
  post 'manufacturer/create'
  end

  namespace :admin do
  get 'manufacturer/edit'
  end

  namespace :admin do
  get 'manufacturer/update'
  post 'manufacturer/update'
  end

  namespace :admin do
  get 'manufacturer/destroy'
  post 'manufacturer/destroy'
  end

  namespace :admin do
  get 'manufacturer/show'
  end

  namespace :admin do
  get 'manufacturer/index'
  end

  get 'cart/add'
  post 'cart/add'
  get 'cart/remove'
  post 'cart/remove'
  get 'cart/clear'
  post 'cart/clear'

  get 'user_sessions/new'
  get 'user_sessions/create' # for showing failed login screen after restarting web server
  post 'user_sessions/create'
  get 'user_sessions/destroy'

  get 'user/new'
  post 'user/create'
  get 'user/show'
  get 'user/show/:id' => 'user#show'
  get 'user/edit'
  post 'user/update'

  get 'checkout/index'
  post 'checkout/submit_order'
  get 'checkout/thank_you'

  get 'about/index'

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
