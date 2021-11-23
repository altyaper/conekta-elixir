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
    {:conekta, "~> 1.0"}
  ]
end
```

### Configuration
Add your keys in your `config.exs` file

```elixir
# config.exs
config :conekta,
  public_key: "YOUR-PUBLIC-KEY",
  private_key: "YOUR-PRIVATE-KEY"

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

## Payment Links

### Create

```elixir
iex> Conekta.Checkouts.create_payment_link(%PaymentLink{
  name: "a payment link", 
  type: "PaymentLink", 
  expires_at: 1637714928, 
  recurrent: false, 
  allowed_payment_methods: ["cash", "card", "bank_transfer"], 
  monthly_installments_enabled: false, 
  order_template: %{
    currency: "MXN", 
    customer_info: %{
      name: "test paymentlink", 
      email: "pedro+test@ventup.com.mx", 
      phone: "8115898281"
    }, 
    line_items: [
      %{
        name: "ventup month", 
        unit_price: 10000, 
        quantity: 1
      }
    ]
  }, 
  needs_shipping_contact: false
})

iex> {:ok,
 %{
   "allowed_payment_methods" => ["card", "cash", "bank_transfer"],
   "can_not_expire" => false,
   "emails_sent" => 0,
   "exclude_card_networks" => [],
   "expires_at" => 1637714928,
   "force_3ds_flow" => false,
   "id" => "d8d629ef-4d34-4b59-bf24-17acdddb7553",
   "livemode" => false,
   "metadata" => %{},
   "monthly_installments_enabled" => false,
   "monthly_installments_options" => [],
   "name" => "a payment link",
   "needs_shipping_contact" => false,
   "object" => "checkout",
   "paid_payments_count" => 0,
   "recurrent" => false,
   "slug" => "d8d629ef4d344b59bf2417acdddb7553",
   "sms_sent" => 0,
   "starts_at" => 1637647200,
   "status" => "Issued",
   "type" => "PaymentLink",
   "url" => "https://pay.conekta.com/link/d8d629ef4d344b59bf2417acdddb7553"
 }}
```

## WebHooks

Helper function for webhook handling. [check possible events](https://developers.conekta.com/resources/webhooks)

```elixir
case Conekta.WebHook.received(params) do
  {:charge_created, struct} -> ...
  {:charge_paid, struct} -> ...
  {:plan_created, struct} -> ...
  {:customer_created, struct} -> ...
  {:subscription_created, struct} -> ...
  {:subscription_paid, struct} -> ...
  {:subscription_canceled, struct} -> ...
  {:chargeback_created, struct} -> ...
  {:chargeback_lost, struct} -> ...
end
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

Developed by [Jorge Chavez](https://twitter.com/JorgeChavz). 

Available with [MIT License](https://github.com/echavezNS/conekta-elixir/blob/master/LICENSE).

Maintainer of this fork: [Ventup](https://github.com/Ventup-IT)
