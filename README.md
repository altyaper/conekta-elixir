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

You can also set configuration per-process for multi-tenant use:

```elixir
Conekta.Wrapper.put_config(%{
  privatekey: "key_for_this_tenant",
  locale: "es",
  apiversion: "2.0.0"
})
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

# Find, update, delete
{:ok, customer} = Conekta.Customers.find("cus_abc123")
{:ok, updated} = Conekta.Customers.update("cus_abc123", %Conekta.Customer{name: "New Name"})
{:ok, deleted} = Conekta.Customers.delete("cus_abc123")
```

#### Payment Sources

```elixir
{:ok, sources} = Conekta.Customers.payment_sources("cus_abc123")
{:ok, source} = Conekta.Customers.create_payment_source("cus_abc123", %{
  token_id: "tok_test_visa_4242",
  type: "card"
})
{:ok, deleted} = Conekta.Customers.delete_payment_source("cus_abc123", "src_xyz")
```

#### Shipping Contacts

```elixir
{:ok, contacts} = Conekta.Customers.shipping_contacts("cus_abc123")
{:ok, contact} = Conekta.Customers.create_shipping_contact("cus_abc123", %{
  phone: "1234567890",
  address: %{street1: "123 Main St", postal_code: "00000", country: "MX"}
})
{:ok, updated} = Conekta.Customers.update_shipping_contact("cus_abc123", "ship_xyz", %{
  phone: "0987654321"
})
{:ok, deleted} = Conekta.Customers.delete_shipping_contact("cus_abc123", "ship_xyz")
```

### Orders

```elixir
# List all orders
{:ok, orders} = Conekta.Orders.orders()

# Create an order
new_order = %Conekta.Order{
  currency: "MXN",
  customer_info: %{customer_id: "cus_abc123"},
  line_items: [%{name: "Product 1", unit_price: 35_000, quantity: 1}],
  charges: [%{payment_method: %{type: "default"}}]
}
{:ok, order} = Conekta.Orders.create(new_order)

# Find, update
{:ok, order} = Conekta.Orders.find("ord_abc123")
{:ok, updated} = Conekta.Orders.update("ord_abc123", %Conekta.Order{currency: "USD"})

# Charges
{:ok, charges} = Conekta.Orders.charges("ord_abc123")
{:ok, charge} = Conekta.Orders.create_charge("ord_abc123", %{
  payment_method: %{type: "default"}
})

# Refunds
{:ok, refund} = Conekta.Orders.refund("ord_abc123", %{reason: "requested_by_client"})
{:ok, refund} = Conekta.Orders.partial_refund("ord_abc123", %{
  reason: "requested_by_client",
  amount: 10_000
})
```

### Plans

```elixir
# Create a plan
plan = %Conekta.Plan{
  name: "Monthly Plan",
  amount: 5000,
  currency: "MXN",
  interval: "month",
  frequency: 1
}
{:ok, created} = Conekta.Plans.create(plan)

# List, find, update, delete
{:ok, plans} = Conekta.Plans.plans()
{:ok, plan} = Conekta.Plans.find("plan_abc123")
{:ok, updated} = Conekta.Plans.update("plan_abc123", %Conekta.Plan{name: "Updated Plan"})
{:ok, deleted} = Conekta.Plans.delete("plan_abc123")
```

### Subscriptions

Manage the full subscription lifecycle on a customer:

```elixir
# Create a subscription
{:ok, sub} = Conekta.Subscriptions.create("cus_abc123", %Conekta.SubscriptionRequest{
  plan_id: "plan_abc123"
})

# Get, update
{:ok, sub} = Conekta.Subscriptions.get("cus_abc123")
{:ok, sub} = Conekta.Subscriptions.update("cus_abc123", %Conekta.SubscriptionRequest{
  plan_id: "plan_new"
})

# Pause, resume, cancel
{:ok, sub} = Conekta.Subscriptions.pause("cus_abc123")
{:ok, sub} = Conekta.Subscriptions.resume("cus_abc123")
{:ok, sub} = Conekta.Subscriptions.cancel("cus_abc123")
```

### Payment Links

Generate payment URLs to send to customers:

```elixir
# Create a payment link
checkout = %Conekta.Checkout{
  name: "Product Payment",
  type: "PaymentLink",
  allowed_payment_methods: ["card", "cash"],
  recurrent: false,
  order_template: %Conekta.CheckoutOrderTemplate{
    currency: "MXN",
    line_items: [%{name: "T-Shirt", unit_price: 25_000, quantity: 1}]
  }
}
{:ok, link} = Conekta.PaymentLinks.create(checkout)
IO.puts(link.url) # => "https://pay.conekta.com/checkout/..."

# List, find, cancel
{:ok, links} = Conekta.PaymentLinks.list()
{:ok, link} = Conekta.PaymentLinks.find("checkout_abc123")
{:ok, canceled} = Conekta.PaymentLinks.cancel("checkout_abc123")

# Send via email or SMS
{:ok, link} = Conekta.PaymentLinks.send_email("checkout_abc123", "customer@example.com")
{:ok, link} = Conekta.PaymentLinks.send_sms("checkout_abc123", "+521234567890")
```

### Charges

List and update charges across all orders:

```elixir
{:ok, charges} = Conekta.Charges.list()
{:ok, charge} = Conekta.Charges.find("chr_abc123")
{:ok, updated} = Conekta.Charges.update("chr_abc123", %Conekta.ChargeUpdateRequest{
  reference_id: "my_ref_123"
})
```

### Tokens

Tokenize card data for secure payment processing:

```elixir
token = %Conekta.Token{
  card: %Conekta.TokenCard{
    number: "4242424242424242",
    name: "John Doe",
    exp_month: "12",
    exp_year: "25",
    cvc: "123"
  }
}
{:ok, result} = Conekta.Tokens.create(token)
IO.puts(result.id) # => "tok_..."
```

### Webhooks

#### Managing Webhook Endpoints

Register, update, and test your webhook URLs:

```elixir
# Register a webhook endpoint
{:ok, wh} = Conekta.Webhooks.create(%Conekta.WebhookRequest{
  url: "https://myapp.com/api/webhooks/conekta",
  subscribed_events: ["charge.paid", "order.created"]
})

# List, find, update, delete
{:ok, webhooks} = Conekta.Webhooks.list()
{:ok, wh} = Conekta.Webhooks.find("wh_abc123")
{:ok, wh} = Conekta.Webhooks.update("wh_abc123", %Conekta.WebhookUpdateRequest{
  url: "https://myapp.com/api/v2/webhooks"
})
{:ok, deleted} = Conekta.Webhooks.delete("wh_abc123")

# Send a test ping
{:ok, wh} = Conekta.Webhooks.test("wh_abc123")
```

#### Parsing Incoming Webhooks

Handle webhook payloads in your controller:

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

# Include webhook logs
{:charge_paid, charge, logs} = Conekta.WebHook.received(params, :logs)
```

### Events

Retrieve and resend webhook events:

```elixir
{:ok, events} = Conekta.Events.list()
{:ok, event} = Conekta.Events.find("evt_abc123")
{:ok, resent} = Conekta.Events.resend("evt_abc123", "webhook_log_id")
```

### Balances

Check your account balance:

```elixir
{:ok, balance} = Conekta.Balances.get()
```

## Testing

Run unit tests:

```bash
mix test
```

Run integration tests against Conekta's sandbox (requires `CONEKTA_PRIVATE_KEY`):

```bash
export CONEKTA_PRIVATE_KEY=your_sandbox_key
mix test test/integration --include integration
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/my-feature`)
3. Commit your changes (`git commit -am 'Add my feature'`)
4. Push to the branch (`git push origin feature/my-feature`)
5. Open a Pull Request

## License

[MIT](LICENSE)
