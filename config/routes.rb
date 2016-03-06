Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
    root 'events#index'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  resources :books, only: [:index, :create, :edit, :update]
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  resources :users, controller: :users, only: [:create, :index, :update, :edit, :destroy]
  # Example resource route (maps HTTP verbs to controller actions automatically):
    resources :events do
      get 'send_event_email', on: :member
      resources :responses
    end
    resources :partners
    resources :recipes
end
