class SubscriptionSerializer
  include JSONAPI::Serializer

  attributes  :price,
              :frequency,
              :title,
              :status,
              :customer_id,
              :tea_id

  belongs_to :customer
  belongs_to :tea
end
