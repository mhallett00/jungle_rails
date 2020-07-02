# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

!["Screenshot of the home page, display size < 1024px"](https://raw.githubusercontent.com/mhallett00/jungle_rails/master/public/images/product_screen.png)

User functionality allows for both visitors and registered users to browse items and order using stripe.

!["Screenshot of the payment screen, display size < 1024px"](https://raw.githubusercontent.com/mhallett00/jungle_rails/master/public/images/payment_screen.png)

!["Screenshot of the order onfirmation screen, display size < 1024px"](https://raw.githubusercontent.com/mhallett00/jungle_rails/master/public/images/order_confirmation_screen.png)

Admin level credentials can modify products and categories and have acces to a dashboard.

!["Screenshot of the admin product page, display size < 1024px"](https://raw.githubusercontent.com/mhallett00/jungle_rails/master/public/images/admin_product_page.png)

Completed by Michael Hallett while at Lighthouse Labs

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
