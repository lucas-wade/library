Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
  #get 'password_resets/new'

 # get 'password_resets/edit'

  root             'static_pages#language_select'

  get     'home'    => 'static_pages#home'
  get     'about'   => 'static_pages#about'
  get     'admin'   => 'static_pages#admin'
  get     'library' => 'static_pages#library'
  get     'classroom_doors' => 'static_pages#classroom_doors'
  get     'translations' => 'static_pages#translations'
  get     'signup'  => 'users#new'
  get     'login'   => 'sessions#new'
  post    'login'   => 'sessions#create'
  delete  'logout'  => 'sessions#destroy'
  post    'admin/edit_toggle' =>'admin#edit_toggle'



  resources :users do
    member do
      get :following, :followers
      post :admin_toggle
    end
  end


  resources :microposts,          only: [:create, :destroy]
  resources :users

  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :relationships,       only: [:create, :destroy]
  resources :families,       only: [:create, :destroy]
  resources :topics
  resources :pubs
  resources :attachmentships,       only: [:create, :edit, :destroy]
  resources :topic_translationships,       only: [:create, :edit, :destroy]
  resources :pub_translationships,       only: [:create, :edit, :destroy]
  resources :admin
  #root 'static_pages#home', as: 'home', via: :all

  end

  resources :account_activations, only: [:edit]

    #resources :topics
    #resources :pubs
    #resources :static_pages
    #resources :users
    #resources :microposts


  #match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
  #match '', to: redirect("/#{I18n.default_locale}")

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
