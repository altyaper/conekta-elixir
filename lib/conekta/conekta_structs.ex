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
    defstruct has_more: nil, total: nil, object: nil, data: nil, is_refundable: nil
end

defmodule Conekta.OrdersCreateResponse do
    @moduledoc false
    defstruct livemode: nil, amount: nil, currency: nil, payment_status: nil, amount_refunded: nil, customer_info: nil, object: nil, id: nil, metadata: nil, created_at: nil, updated_at: nil, line_items: nil, parent_id: nil, charges: nil
end

defmodule Conekta.OrdersFindResponse do
    @moduledoc false
    defstruct livemode: nil, amount: nil, currency: nil, payment_status: nil, amount_refunded: nil, customer_info: nil, object: nil, id: nil, metadata: nil, created_at: nil, updated_at: nil, changes: nil, is_refundable: nil
end

defmodule Conekta.OrdersUpdateReponse do
    @moduledoc false
    defstruct id: nil, is_refundable: nil
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

defmodule Conekta.PlanCreateResponse do
    @moduledoc false
    defstruct id: nil, livemode: nil, object: nil, name: nil, amount: nil, currency: nil, interval: nil, frequency: nil, trial_period_days: nil, expiry_count: nil, created_at: nil
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

defmodule Conekta.BalanceResponse do
    @moduledoc false
    defstruct available: nil, cashout_retention_amount: nil, conekta_retention: nil, gateway: nil, pending: nil, retained: nil, retention_amount: nil, target_collateral_amount: nil, target_retention_amount: nil, temporarily_retained: nil
end

defmodule Conekta.EventResponse do
    @moduledoc false
    defstruct id: nil, object: nil, type: nil, livemode: nil, created_at: nil, data: nil, webhook_status: nil, webhook_logs: nil
end

defmodule Conekta.EventsResponse do
    @moduledoc false
    defstruct has_more: nil, object: nil, data: nil
end

defmodule Conekta.EventResendResponse do
    @moduledoc false
    defstruct id: nil, url: nil, failed_attempts: nil, last_attempted_at: nil, last_http_response_status: nil, response_data: nil
end

defmodule Conekta.ChargeResponse do
    @moduledoc false
    defstruct id: nil, object: nil, status: nil, amount: nil, currency: nil, order_id: nil, customer_id: nil, livemode: nil, created_at: nil, paid_at: nil, payment_method: nil, description: nil, failure_code: nil, failure_message: nil, reference_id: nil, refunds: nil
end

defmodule Conekta.ChargesResponse do
    @moduledoc false
    defstruct has_more: nil, object: nil, data: nil
end

defmodule Conekta.ChargeUpdateRequest do
    @moduledoc false
    defstruct reference_id: nil
end

defmodule Conekta.TokenCard do
    @moduledoc false
    defstruct number: nil, name: nil, exp_month: nil, exp_year: nil, cvc: nil, device_fingerprint: nil
end

defmodule Conekta.Token do
    @moduledoc false
    defstruct card: nil
end

defmodule Conekta.TokenResponse do
    @moduledoc false
    defstruct id: nil, object: nil, livemode: nil, used: nil
end

defmodule Conekta.WebhookRequest do
    @moduledoc false
    defstruct url: nil, subscribed_events: nil
end

defmodule Conekta.WebhookUpdateRequest do
    @moduledoc false
    defstruct url: nil, subscribed_events: nil, active: nil
end

defmodule Conekta.WebhookResponse do
    @moduledoc false
    defstruct id: nil, object: nil, url: nil, status: nil, active: nil, livemode: nil, description: nil, subscribed_events: nil
end

defmodule Conekta.WebhooksResponse do
    @moduledoc false
    defstruct has_more: nil, object: nil, data: nil
end

defmodule Conekta.Checkout do
    @moduledoc false
    defstruct name: nil, type: nil, allowed_payment_methods: nil, recurrent: nil, expires_at: nil, needs_shipping_contact: nil, order_template: nil, monthly_installments_enabled: nil, monthly_installments_options: nil
end

defmodule Conekta.CheckoutOrderTemplate do
    @moduledoc false
    defstruct currency: nil, line_items: nil, customer_info: nil, metadata: nil
end

defmodule Conekta.CheckoutResponse do
    @moduledoc false
    defstruct id: nil, name: nil, object: nil, livemode: nil, status: nil, type: nil, url: nil, slug: nil, recurrent: nil, allowed_payment_methods: nil, expires_at: nil, needs_shipping_contact: nil, monthly_installments_enabled: nil, monthly_installments_options: nil, payments_limit_count: nil, paid_payments_count: nil, emails_sent: nil, sms_sent: nil
end

defmodule Conekta.CheckoutsResponse do
    @moduledoc false
    defstruct has_more: nil, object: nil, data: nil
end

defmodule Conekta.SubscriptionRequest do
    @moduledoc false
    defstruct plan_id: nil, card_id: nil, trial_end: nil
end

defmodule Conekta.SubscriptionResponse do
    @moduledoc false
    defstruct id: nil, object: nil, status: nil, plan_id: nil, card_id: nil, customer_id: nil, created_at: nil, subscription_start: nil, billing_cycle_start: nil, billing_cycle_end: nil, canceled_at: nil, paused_at: nil, trial_start: nil, trial_end: nil
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

defmodule Conekta.ChargebackWebhookPost do
    @moduledoc false
    defstruct id: nil, object: nil, status: nil, reason: nil, note: nil, followup_status: nil, response_from_client: nil, charge_id: nil, created_at: nil, evidence_due_by: nil, filed: nil, previous_attributes: nil
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

defmodule Conekta.ChargeWebHookPost do
    @moduledoc false
    defstruct id: nil, livemode: nil, created_at: nil, status: nil, currency: nil, description: nil, failure_code: nil, failure_message: nil, monthly_installments: nil, object: nil, paid_at: nil, fee: nil, customer_id: nil, refunds: nil, amount: nil, previous_attributes: nil, payment_method: nil, expires_at: nil, token_id: nil
end

defmodule Conekta.CustomerWebHookPost do
    @moduledoc false
    defstruct id: nil, email: nil, name: nil, phone: nil, livemode: nil, default_card_id: nil, object: nil, created_at: nil, cards: nil, subscription: nil
end

defmodule Conekta.Charge do
    @moduledoc false
    defstruct amount: nil, payment_method: nil, expires_at: nil, token_id: nil
end

defmodule Conekta.OrderCreateChargeResponse do
    @moduledoc false
    defstruct amount: nil
end

defmodule Conekta.WebHookLogs do
    @moduledoc false
    defstruct id: nil, url: nil, failed_attempts: nil, last_http_response_status: nil, object: nil, last_attempted_at: nil
end

defmodule Conekta.Refund do
    @moduledoc false
    defstruct reason: nil
end

defmodule Conekta.PartialRefund do
    @moduledoc false
    defstruct reason: nil, amount: nil
end
