# README

This README will outline whatever steps are necessary to get the
application up and running. This application is a Rails API app about a tea subscription service.

* Ruby version: 3.2.3

* Rails version: 7.1.3.4

* Configuration: Clone Repo from Github and run the command below to create the dB. There is already data provided in the seeds.rb file to get started. Run the testing suite to see all tests are passing, and use Simplecov gem to see full percentage of coverage.

* Database creation: Run `rails db:{drop,create,migrate,seed}

* How to run the test suite: Install RSpec and run `bundle exec rspec`

## ENDPOINTS OF THIS API

Below are the different endpoints available in the application.

### Subscribe a customer to a tea subscription:

`POST /api/v0/customers/:customer_id/subscriptions`

This endpoint will return the following JSON:

```
{
  "data": {
    "id": "3",
    "type": "subscription",
    "attributes": {
      "price": 14.99,
      "frequency": "monthly",
      "title": "Monthly Oolong Tea Subscription",
      "status": "active",
      "customer_id": 1,
      "tea_id": 3
    },
    "relationships": {
      "customer": {
        "data": {
          "id": "1",
          "type": "customer"
        }
      },
      "tea": {
        "data": {
          "id": "3",
          "type": "tea"
        }
      }
    }
  }
}
```

### Cancel a customer's tea subscription

`DELETE /api/v0/customers/:customer_id/subscriptions/:id`

This endpoint will return a 204 status.

### See all of a customer's tea subscriptions

`GET /api/v0/customers/:customer_id/subscriptions`

This endpoint will return the following JSON:

```{
    "data": [
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "price": 49.99,
                "frequency": 0,
                "title": "Quarterly Green Jasmine Subscription",
                "status": "cancelled",
                "customer_id": 1,
                "tea_id": 2
            },
            "relationships": {
                "customer": {
                    "data": {
                        "id": "1",
                        "type": "customer"
                    }
                },
                "tea": {
                    "data": {
                        "id": "2",
                        "type": "tea"
                    }
                }
            }
        }
    ]
}```