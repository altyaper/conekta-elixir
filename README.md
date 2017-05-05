## Conekta Library


Wrapper to connect with https://api.conekta.io.


# Setup

### Configuration
Add your keys in your `config.exs` file

```elixir
# config.exs
config :conekta,
  publickey: "YOUR-PUBLIC-KEY",
  privatekey: "YOUR-PRIVATE-KEY"

```

# Customers

### Get

```elixir
#Get the last
Conekta.Customers.customers()
```

### Create

```elixir
#Create a new customer map
new_customer = %Customer{
  name: "Fake Name",
  email: "fake@email.com",
  corporate: true,
  payment_sources: [%{
      token_id: "tok_test_visa_4242",
      type: "card"
  }]
}

#Create a new customer
Conekta.Customers.create_customer(new_customer)

```

# Orders

### Get

```elixir
Conekta.Orders.orders()
```

### Create

```elixir
#Create a new order map
new_order = %Order{currency: "MXN",
customer_info: %{
    customer_id: content.id
}, line_items: [%{
    name: "Product 1",
    unit_price: 35000,
    quantity: 1
}], charges: [%{
    payment_method: %{
        type: "default"
    }
}]}

#Create an order
response = Conekta.Orders.create_order(new_order)
```
