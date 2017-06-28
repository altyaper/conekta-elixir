[![Build Status](https://travis-ci.org/echavezNS/conekta-elixir.svg?branch=master)](https://travis-ci.org/echavezNS/conekta-elixir)

# Conekta Library


Wrapper to connect with https://api.conekta.io.

[conekta-elixir documentation](https://hexdocs.pm/conekta/api-reference.html)

## Setup

### Installation

Add Conekta to your `mix.exs` dependencies:

```elixir
#mix.exs
defp deps do
  [
    #If you have trouble with poison add
    #{:poison, "~> 3.1", override: true}
    {:conekta, "~> 1.0"}
  ]
end
```

### Configuration
Add your keys in your `config.exs` file

```elixir
# config.exs
config :conekta,
  publickey: "YOUR-PUBLIC-KEY",
  privatekey: "YOUR-PRIVATE-KEY"

```

## Customers

### Get
Get all current customers
```elixir
#Get the last
Conekta.Customers.customers()
```

### Create
Create a customer by passing a `%Conekta.Customer{}` struct

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
Conekta.Customers.create(new_customer)

```

### Find
Find a customer by passing the unique ID
```elixir
Conekta.Customers.find(id)
```

### Delete
Delete a customer by passing the unique ID
```elixir
Conekta.Customers.delete(id)
```


## Orders

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
response = Conekta.Orders.create(new_order)
```

## Test
If you want to add something new, make sure all the tests pass before making a PR
```elixir
mix test
```

### Send pull request
I would love to check new contributions to this repository.
Fork from **dev** and do a PR into **dev** again.  

### License

Developed by [Jorge Chavez](https://twitter.com/JorgeChavz). Available with [MIT License](https://github.com/echavezNS/conekta-elixir/blob/master/LICENSE).
