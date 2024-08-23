# # Sample data for testing
# customer = Customer.create!(first_name: "Joe", last_name: "Mama", email: "blah@blah.com", address: "123 Main St", password_digest: "password")

# green = Tea.create!(title: "Green Tea", description: "A soothing green tea", temp: 80, brew_time: 2)
# black = Tea.create!(title: "Black Tea", description: "A strong black tea", temp: 90, brew_time: 3)

# Subscription.create!(title: "Monthly Green Tea", price: 10.0, status: 1, frequency: 1, customer: customer, tea: green)
# Subscription.create!(title: "Monthly Black Tea", price: 12.0, status: 1, frequency: 1, customer: customer, tea: black)

customer = Customer.create!(
  first_name: "Blah",
  last_name: "Jones",
  email: "blah@email.com",
  address: "123 Main Street"
)
# Create sample teas
earl_grey = Tea.create!(
  title: "Earl Grey",
  description: "A classic black tea with bergamot.",
  temp: 90,  # temperature in Celsius
  brew_time: 3  # brewing time in minutes
)

green_jasmine = Tea.create!(
  title: "Green Jasmine",
  description: "Green tea with jasmine flowers.",
  temp: 80,  # temperature in Celsius
  brew_time: 2  # brewing time in minutes
)

# Create subscriptions
Subscription.create!(
  customer_id: customer.id,
  tea_id: earl_grey.id,
  title: "Monthly Earl Grey Subscription",
  price: 19.99,
  status: "active",
  frequency: "monthly"
)

Subscription.create!(
  customer_id: customer.id,
  tea_id: green_jasmine.id,
  title: "Quarterly Green Jasmine Subscription",
  price: 49.99,
  status: "active",
  frequency: "quarterly"
)