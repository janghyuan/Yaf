Rails.application.routes.draw do


  devise_for :members
  get 'members/:name' => 'members#show', as: :member
  get 'members/:name/topics' => "topics#my_topics", as: :my_topics
  get 'members/:name/replies' => "topics#my_replies_topics", as: :my_replies_topics
  get 'members/:name/collection' => 'topics#collection', as: :collection
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'topics#index'

  # 主题资源无法在创建后编辑，并且不能删除
  resources :topics, only: [:index, :new, :create] do 
    resources :replies, only: [:index, :create]
    member do 
      post 'add'
    end
  end

  get 'topics/:id' => 'replies#index', as: :single_topic
  
  get 'notifications' => 'notifications#index'

  get 'nodes/new' => 'nodes#new', as: :new_node
  get 'go/:slogan' => 'nodes#show', as: :node
  post 'nodes' => 'nodes#create'
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
