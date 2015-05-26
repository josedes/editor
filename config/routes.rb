require 'subdomain'

Rails.application.routes.draw do
 

  namespace :admin do
    get 'administrators/cms'
    get 'administrators/index'
    get 'administrators/alervac'
  end

  
devise_for :usuarios, controllers: {registrations: "registrations", sessions: "sessions"}

#devise_for :usuarios, controllers: {sessions: "sessions", registrations: "registrations" }

#match '/welcome/:route' => "welcome#dynamicroute", :contraints => DynamicRouteConstraint.new

#match "*path" => "post#show", :constraints => PostConstraint.new

#match "*path" => "comment#show", :constraints => CommentConstraint.new

#get 'welcome/*other', to: 'welcome#estaticas'

#get 'photos/:id', to: 'photos#show', constraints: { id: /[A-Z]\d{5}/ }

#get 'photos', to: 'photos#index', constraints: { subdomain: 'admin' }

#get '*path', to: 'welcome#estaticas',
#    constraints: lambda { |request| Blacklist.retrieve_ips.include?(request.remote_ip) }


#namespace :admin do
#  resources :administors
#end

#get '/' => 'welcome#show', :constraints => Subdomain
#DynamicRouter.load

  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get ':page', to: 'pages_dynamic#show', as: :static, constraints: { page: /[a-zA-Z\-_\/]+/ }

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
