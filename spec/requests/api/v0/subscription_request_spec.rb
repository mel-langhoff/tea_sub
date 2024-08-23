
require 'rails_helper'

RSpec.describe Api::V0::SubscriptionsController, type: :controller do
  let(:customer) { Customer.create!(first_name: 'Joe', last_name: 'Mana', email: 'blah@example.com', address: '123 Main St', password_digest: 'password') }
  let(:tea) { Tea.create!(title: 'Green Tea', description: 'A soothing green tea', temp: 80, brew_time: 2) }
  let(:subscription) { Subscription.create!(title: 'Monthly Green Tea', price: 10.0, status: 'active', frequency: 1, customer: customer, tea: tea) }

  describe "#index" do
    it "returns a success response" do
      get :index, params: { customer_id: customer.id }
      expect(response).to be_successful
    end
  end

  describe "#create" do
    it "creates a new subscription" do
      expect {
        post :create, params: { customer_id: customer.id, subscription: { title: 'Monthly Green Tea', price: 10.0, status: 'active', frequency: 1, tea_id: tea.id } }
      }.to change(customer.subscriptions, :count).by(1)
    end
  end

  describe "#update" do
    it "cancels the subscription" do
      patch :update, params: { customer_id: customer.id, id: subscription.id, subscription: { status: 'cancelled' } }
      subscription.reload
      expect(subscription.status).to eq('cancelled')
    end
  end
end
