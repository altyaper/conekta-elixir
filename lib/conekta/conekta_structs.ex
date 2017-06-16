defmodule Conekta.CustomerDeleteResponse do
  @moduledoc false
  defstruct id: nil, name: nil, email: nil, phone: nil, livemode: nil, object: nil, created_at: nil, corporate: nil, delete: nil
end

defmodule CustomerUpdateResponse do
    @moduledoc false
    defstruct livemode: nil, name: nil, email: nil, id: nil, object: nil, created_at: nil, corporate: nil
end

defmodule Conekta.CustomerFindResponse do
    @moduledoc false
    defstruct id: nil, name: nil, phone: nil, email: nil, livemode: nil, corporate: nil, created_at: nil, object: nil
end

defmodule Conekta.Customer do
    @moduledoc false
    defstruct id: nil, name: nil, phone: nil, email: nil, plan_id: nil, payment_sources: nil, corporate: nil, shipping_contacts: nil, suscriptions: nil
end

defmodule Conekta.CustomersResponse do
    @moduledoc false
    defstruct has_more: nil, total: nil, object: nil, data: nil
end

defmodule Conekta.ErrorResponse do
    @moduledoc false
    defstruct details: nil, object: nil, type: nil
end

defmodule Conekta.Order do
    @moduledoc false
    defstruct currency: nil, customer_info: nil, line_items: nil, charges: nil, shipping_lines: nil, shipping_contact: nil
end

defmodule Conekta.OrdersResponse do
    @moduledoc false
    defstruct has_more: nil, total: nil, object: nil, data: nil
end

defmodule Conekta.OrdersCreateResponse do
    @moduledoc false
    defstruct livemode: nil, amount: nil, currency: nil, payment_status: nil, amount_refunded: nil, customer_info: nil, object: nil, id: nil, metadata: nil, created_at: nil, updated_at: nil, line_items: nil, parent_id: nil, metadata: nil, charges: nil
end

defmodule Conekta.OrdersFindResponse do
    @moduledoc false
    defstruct livemode: nil, amount: nil, currency: nil, payment_status: nil, amount_refunded: nil, customer_info: nil, object: nil, id: nil, metadata: nil, created_at: nil, updated_at: nil, changes: nil
end

defmodule Conekta.OrdersUpdateReponse do
    @moduledoc false
    defstruct id: nil
end

defmodule Conekta.PlansResponse do
    @moduledoc false
    defstruct has_more: nil, total: nil, object: nil, data: nil
end

defmodule Conekta.PlanFindResponse do
    @moduledoc false
    defstruct id: nil, livemode: nil, object: nil, frequency: nil, interval: nil, currency: nil, amount: nil, name: nil, created_at: nil
end

defmodule Conekta.Plan do
    @moduledoc false
    defstruct id: nil, name: nil, amount: nil, currency: nil, interval: nil, frequency: nil, trial_period_days: nil, expiry_count: nil
end

defmodule Conekta.PlanUpdateResponse do
    @moduledoc false
    defstruct id: nil, name: nil, amount: nil, currency: nil, interval: nil, frequency: nil, created_at: nil
end

defmodule Conekta.PlanDeleteResponse do
    @moduledoc false
    defstruct id: nil, name: nil, amount: nil, currency: nil, interval: nil, frequency: nil, created_at: nil, deleted: nil
end

defmodule Conekta.CustomerSubscriptionResponse do
    @moduledoc false
    defstruct id: nil, status: nil, object: nil, created_at: nil, subscription_start: nil, billing_cycle_start: nil, billing_cycle_end: nil, plan_id: nil, customer_id: nil, card_id: nil
end

defmodule Conekta.PaymentSource do
    @moduledoc false
    defstruct token_id: nil, type: nil
end

defmodule Conekta.CustomerPaymentSourcesResponse do
    @moduledoc false
    defstruct has_more: nil, total: nil, object: nil, data: nil
end

defmodule Conekta.OrderChargesResponse do
    @moduledoc false
    defstruct has_more: nil, object: nil, data: nil
end

defmodule Conekta.CustomerCreatePaymentSourceResponse do
    @moduledoc false
    defstruct id: nil, object: nil, type: nil, created_at: nil, last4: nil, bin: nil, exp_month: nil, exp_year: nil, brand: nil, name: nil, parent_id: nil, default: nil
end


defmodule Conekta.CustomerShippingContactsResponse do
    @moduledoc false
    defstruct has_more: nil, total: nil, object: nil, data: nil
end

defmodule Conekta.CustomerDeletePaymentSourceResponse do
    @moduledoc false
    defstruct id: nil, object: nil, type: nil, created_at: nil, last4: nil, bin: nil, exp_month: nil, exp_year: nil, brand: nil, name: nil, parent_id: nil, default: nil, deleted: nil
end

defmodule Conekta.CustomerCreateShippingContactResponse do
    @moduledoc false
    defstruct phone: nil, receiver: nil, between_streets: nil, address: nil
end

defmodule Conekta.ShippingContact do
    @moduledoc false
    defstruct phone: nil, receiver: nil, between_streets: nil, address: %{street1: nil, postal_code: nil, country: nil}
end

defmodule Conekta.CustomerUpdateShippingContactResponse do
    @moduledoc false
    defstruct receiver: nil, phone: nil, between_streets: nil, address: nil, id: nil, object: nil, created_at: nil, parent_id: nil, default: nil
end

defmodule Conekta.CustomerDeleteShippingContactResponse do
    @moduledoc false
    defstruct receiver: nil, phone: nil, between_streets: nil, address: nil, id: nil, object: nil, created_at: nil, parent_id: nil, default: nil, deleted: nil
end

defmodule Conekta.Charge do
    @moduledoc false
    defstruct amount: nil, payment_method: nil, expires_at: nil, token_id: nil
end

defmodule Conekta.OrderCreateChargeResponse do
    @moduledoc false
    defstruct amount: nil
end
