
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
    xit "creates a new subscription" do
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

# require 'rails_helper'

# RSpec.describe "Subscriptions", type: :request do
#   let(:customer) do
#     Customer.create!(
#       Customer.create!(
#         first_name: "Joe", 
#         last_name: "Mama", 
#         email: "blah@blah.com", 
#         address: "123 Main St", 
#         password_digest: "password")
#     )
#   end

#   let(:green) do
#     Tea.create!(
#       title: "Green Tea",
#       description: "A soothing green tea",
#       temperature: 75,
#       brew_time: 2
#     )
#   end

#   let(:black) do
#     Tea.create!(
#       title: "Black Tea",
#       description: "A good black tea",
#       temperature: 85,
#       brew_time: 3
#     )
#   end

#   let(:subscription1) do
#     Subscription.create!(
#       title: "Subscription 1",
#       price: 9.99,
#       status: 1,
#       frequency: 1,
#       customer: customer,
#       tea: green
#     )
#   end

#   let(:subscription2) do
#     Subscription.create!(
#       title: "Subscription 2",
#       price: 14.99,
#       status: 1,
#       frequency: 1,
#       customer: customer,
#       tea: black
#     )
#   end

#   describe "GET /customers/:customer_id/subscriptions" do
#     it "returns a list of subscriptions for the specified customer" do
#       subscription1
#       subscription2

#       get "/customers/#{customer.id}/subscriptions"

#       expect(response).to have_http_status(:ok)
#       expect(response.content_type).to start_with('application/json')

#       json_response = JSON.parse(response.body)
#       expect(json_response.size).to eq(2)
#       expect(json_response.map { |subscription| subscription['id'] }).to match_array([subscription1.id, subscription2.id])
#     end
#   end

#   describe "POST /subscriptions" do
#     context "with valid parameters" do
#       it "creates a new subscription" do
#         post_params = {
#           subscription: {
#             title: "Subscription 1",
#             price: 9.99,
#             status: "active",
#             frequency: "monthly",
#             customer_id: customer.id,
#             tea_id: tea1.id
#           }
#         }

#         post "/subscriptions", params: post_params

#         expect(response).to have_http_status(:created)
#         expect(response.content_type).to start_with('application/json')

#         json_response = JSON.parse(response.body)
#         expect(json_response['title']).to eq('Subscription 1')
#       end
#     end

#     context "with invalid parameters" do
#       it "returns an error message" do
#         post_params = {
#           subscription: {
#             title: nil,
#             price: 9.99,
#             status: "active",
#             frequency: "monthly"
#           }
#         }

#         post "/subscriptions", params: post_params

#         expect(response).to have_http_status(:unprocessable_entity)
#         expect(response.content_type).to start_with('application/json')

#         json_response = JSON.parse(response.body)
#         expect(json_response['errors']).to be_present
#       end
#     end
#   end

#   describe "DELETE /subscriptions/:id" do
#     it "cancels the subscription" do
#       subscription_to_delete = subscription1

#       delete "/subscriptions/#{subscription_to_delete.id}"
#       expect(response).to have_http_status(:no_content)
#       subscription_to_delete.reload
#       expect(subscription_to_delete.status).to eq('cancelled')
#     end
#   end
# end
