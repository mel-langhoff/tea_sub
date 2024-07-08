class Api::V0::SubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    render json: SubscriptionSerializer.new(customer.subscriptions)
  end

  def create
    subscription = Subscription.new(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: :created
    else
      render json: { errors: subscription.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    subscription = Subscription.find(params[:id])
    if subscription.update(status: 'cancelled')
      render json: SubscriptionSerializer.new(subscription), status: :ok
    else
      render json: { errors: subscription.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:customer_id, :tea_id, :title, :price, :status, :frequency)
  end
end


# class Api::V0::SubscriptionsController < ApplicationController
#   # GET /customers/customer_id/subscriptions
#   # def index
#   #     customer = Customer.find(params[:customer_id])

#   #     render json: SubscriptionSerializer.new(customer.subscriptions)
#   # end

#   class SubscriptionsController < ApplicationController
#     def index
#       customer = Customer.find(params[:customer_id])
#       subscriptions = customer.subscriptions
#       render json: subscriptions, status: :ok
#     end
    
#     def create
#       subscription = Subscription.new(subscription_params)
#       if subscription.save
#         render json: subscription, status: :created
#       else
#         render json: { errors: subscription.errors.full_messages }, status: :unprocessable_entity
#       end
#     end
  
#     def destroy
#       subscription = Subscription.find(params[:id])
#       subscription.update(status: 'cancelled') 
#     end
  
#     private
  
#     def subscription_params
#       params.require(:subscription).permit(:customer_id, :tea_id, :title, :price, :status, :frequency)
#     end
    
#   end
  
#   # # POST /customers/customer_id/subscriptions
#   # def create
#   #     customer = find_customer_by_email(params[:customer_email])
#   #     subscription = customer.subscriptions.new(subscription_params)

#   #     if subscription.save
#   #         render json: SubscriptionSerializer.new(subscription), status: :created
#   #     else
#   #         render json: subscription.errors, status: :unauthorized
#   #     end
#   # end

#   # # POST /customers/customer_id/subscriptions/subscription_id
#   # def update
#   #     subscription = Subscription.find(params[:subscription_id])

#   #     if subscription.update(subscription_params)
#   #         render json: SubscriptionSerializer.new(subscription), status: :ok
#   #     else
#   #         render json: subscription.errors, status: :unprocessable_entity
#   #     end
#   # end
  
#   private

#   def sub_params
#       params.permit(:title, :price, :status, :frequency)
#   end
# end