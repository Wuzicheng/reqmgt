Rails.application.routes.draw do
  resources :users
  resources :sessions, only:[:new,:create,:destroy]
  resources :products
  resources :requirements
  #match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/allrequirements', to: 'requirements#allrequirements', via: 'get'
  match '/allproducts', to: 'products#allproducts', via: 'get'
  match '/creatematchfromRequirement',  to: 'matches#createfromRequirement',   via: 'post'
  match '/deletematchfromRequirement',  to: 'matches#deletefromRequirement',   via: 'post'
  match '/creatematchfromProduct',  to: 'matches#createfromProduct',   via: 'post'
  match '/deletematchfromProduct',  to: 'matches#deletefromProduct',   via: 'post'
  match '/addcomment',  to: 'matches#addcomment',   via: 'patch'

  root 'sessions#new'

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
