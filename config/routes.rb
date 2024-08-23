Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :customers, only: [] do
        resources :subscriptions, only: [:index, :create, :update, :destroy]
      end
    end
  end
end


# Rails.application.routes.draw do
#   namespace :api do
#     namespace :v0 do
#       get 'customers/:customer_id/subscriptions', to: 'subscriptions#index'
#       post 'customers/:customer_id/subscriptions', to: 'subscriptions#create'
#       patch 'customers/:customer_id/subscriptions/:id', to: 'subscriptions#update'
#       delete 'customers/:customer_id/subscriptions/:id', to: 'subscriptions#destroy'
#     end
#   end
# end
