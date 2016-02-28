# == Route Map
#
#              Prefix Verb   URI Pattern                                    Controller#Action
#                root GET    /                                              events#index
#     event_responses GET    /events/:event_id/responses(.:format)          responses#index
#                     POST   /events/:event_id/responses(.:format)          responses#create
#  new_event_response GET    /events/:event_id/responses/new(.:format)      responses#new
# edit_event_response GET    /events/:event_id/responses/:id/edit(.:format) responses#edit
#      event_response GET    /events/:event_id/responses/:id(.:format)      responses#show
#                     PATCH  /events/:event_id/responses/:id(.:format)      responses#update
#                     PUT    /events/:event_id/responses/:id(.:format)      responses#update
#                     DELETE /events/:event_id/responses/:id(.:format)      responses#destroy
#              events GET    /events(.:format)                              events#index
#                     POST   /events(.:format)                              events#create
#           new_event GET    /events/new(.:format)                          events#new
#          edit_event GET    /events/:id/edit(.:format)                     events#edit
#               event GET    /events/:id(.:format)                          events#show
#                     PATCH  /events/:id(.:format)                          events#update
#                     PUT    /events/:id(.:format)                          events#update
#                     DELETE /events/:id(.:format)                          events#destroy
#            partners GET    /partners(.:format)                            partners#index
#                     POST   /partners(.:format)                            partners#create
#         new_partner GET    /partners/new(.:format)                        partners#new
#        edit_partner GET    /partners/:id/edit(.:format)                   partners#edit
#             partner GET    /partners/:id(.:format)                        partners#show
#                     PATCH  /partners/:id(.:format)                        partners#update
#                     PUT    /partners/:id(.:format)                        partners#update
#                     DELETE /partners/:id(.:format)                        partners#destroy
#           passwords POST   /passwords(.:format)                           clearance/passwords#create
#        new_password GET    /passwords/new(.:format)                       clearance/passwords#new
#             session POST   /session(.:format)                             clearance/sessions#create
#       user_password POST   /users/:user_id/password(.:format)             clearance/passwords#create
#  edit_user_password GET    /users/:user_id/password/edit(.:format)        clearance/passwords#edit
#                     PATCH  /users/:user_id/password(.:format)             clearance/passwords#update
#                     PUT    /users/:user_id/password(.:format)             clearance/passwords#update
#               users POST   /users(.:format)                               clearance/users#create
#             sign_in GET    /sign_in(.:format)                             clearance/sessions#new
#            sign_out DELETE /sign_out(.:format)                            clearance/sessions#destroy
#             sign_up GET    /sign_up(.:format)                             clearance/users#new
#

Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
