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

  def destroy
    subscription = Subscription.find(params[:id])
    subscription.destroy
  end

  private

  def subscription_params
    params.require(:subscription).permit(:customer_id, :tea_id, :title, :price, :status, :frequency)
  end
end