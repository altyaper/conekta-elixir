# Conekta Elixir

Elixir wrapper for the [Conekta API](https://api.conekta.io).

[HexDocs documentation](https://hexdocs.pm/conekta/api-reference.html)

## Installation

Add `conekta` to your `mix.exs` dependencies:

```elixir
defp deps do
  [
    {:conekta, "~> 1.1"}
  ]
end
```

Then run:

```bash
mix deps.get
```

## Configuration

Add your API keys in `config/config.exs`:

```elixir
config :conekta,
  publickey: "YOUR_PUBLIC_KEY",
  privatekey: "YOUR_PRIVATE_KEY",
  locale: "es",
  apiversion: "2.0.0"
```

## Usage

### Customers

```elixir
# List all customers
{:ok, customers} = Conekta.Customers.customers()

# Create a customer
new_customer = %Conekta.Customer{
  name: "Jane Doe",
  email: "jane@example.com",
  corporate: true,
  payment_sources: [%{
    token_id: "tok_test_visa_4242",
    type: "card"
  }]
}
{:ok, customer} = Conekta.Customers.create(new_customer)

# Find a customer by ID
{:ok, customer} = Conekta.Customers.find("cus_abc123")

# Update a customer
{:ok, updated} = Conekta.Customers.update("cus_abc123", %Conekta.Customer{name: "New Name"})

# Delete a customer
{:ok, deleted} = Conekta.Customers.delete("cus_abc123")
```

#### Payment Sources

```elixir
# List payment sources
{:ok, sources} = Conekta.Customers.payment_sources("cus_abc123")

# Add a payment source
{:ok, source} = Conekta.Customers.create_payment_source("cus_abc123", %{
  token_id: "tok_test_visa_4242",
  type: "card"
})

# Delete a payment source
{:ok, deleted} = Conekta.Customers.delete_payment_source("cus_abc123", "src_xyz")
```

#### Shipping Contacts

```elixir
# List shipping contacts
{:ok, contacts} = Conekta.Customers.shipping_contacts("cus_abc123")

# Create a shipping contact
{:ok, contact} = Conekta.Customers.create_shipping_contact("cus_abc123", %{
  phone: "1234567890",
  address: %{
    street1: "123 Main St",
    postal_code: "00000",
    country: "MX"
  }
})

# Update a shipping contact
{:ok, updated} = Conekta.Customers.update_shipping_contact("cus_abc123", "ship_xyz", %{
  phone: "0987654321"
})

# Delete a shipping contact
{:ok, deleted} = Conekta.Customers.delete_shipping_contact("cus_abc123", "ship_xyz")
```

#### Subscriptions

```elixir
# Get a customer's subscription
{:ok, subscription} = Conekta.Customers.subscription("cus_abc123")
```

### Orders

```elixir
# List all orders
{:ok, orders} = Conekta.Orders.orders()

# Create an order
new_order = %Conekta.Order{
  currency: "MXN",
  customer_info: %{
    customer_id: "cus_abc123"
  },
  line_items: [%{
    name: "Product 1",
    unit_price: 35_000,
    quantity: 1
  }],
  charges: [%{
    payment_method: %{
      type: "default"
    }
  }]
}
{:ok, order} = Conekta.Orders.create(new_order)

# Find an order by ID
{:ok, order} = Conekta.Orders.find("ord_abc123")

# Update an order
{:ok, updated} = Conekta.Orders.update("ord_abc123", %Conekta.Order{currency: "USD"})

# Get charges for an order
{:ok, charges} = Conekta.Orders.charges("ord_abc123")

# Create a charge for an order
{:ok, charge} = Conekta.Orders.create_charge("ord_abc123", %{
  payment_method: %{type: "default"}
})

# Refund an order
{:ok, refund} = Conekta.Orders.refund("ord_abc123", %{reason: "requested_by_client"})

# Partial refund
{:ok, refund} = Conekta.Orders.partial_refund("ord_abc123", %{
  reason: "requested_by_client",
  amount: 10_000
})
```

### Plans

```elixir
# List all plans
{:ok, plans} = Conekta.Plans.plans()

# Find a plan by ID
{:ok, plan} = Conekta.Plans.find("plan_abc123")

# Update a plan
{:ok, updated} = Conekta.Plans.update("plan_abc123", %{name: "Updated Plan"})

# Delete a plan
{:ok, deleted} = Conekta.Plans.delete("plan_abc123")
```

### Webhooks

Parse incoming webhook payloads into typed structs:

```elixir
case Conekta.WebHook.received(params) do
  {:charge_created, charge} -> # handle new charge
  {:charge_paid, charge} -> # handle paid charge
  {:plan_created, plan} -> # handle new plan
  {:customer_created, customer} -> # handle new customer
  {:subscription_created, sub} -> # handle new subscription
  {:subscription_paid, sub} -> # handle paid subscription
  {:subscription_canceled, sub} -> # handle canceled subscription
  {:chargeback_created, cb} -> # handle new chargeback
  {:chargeback_lost, cb} -> # handle lost chargeback
  {:error, message} -> # handle unknown event
end
```

To include webhook logs, pass the `:logs` option:

```elixir
{:charge_paid, charge, logs} = Conekta.WebHook.received(params, :logs)
```

## Testing

```bash
mix test
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/my-feature`)
3. Commit your changes (`git commit -am 'Add my feature'`)
4. Push to the branch (`git push origin feature/my-feature`)
5. Open a Pull Request

## License

[MIT](LICENSE)
