defmodule Conekta.Customer do
  defstruct id: nil, name: nil, phone: nil, email: nil, plan_id: nil,
  payment_sources: [%{token_id: nil, type: nil}], corporate: nil,
  shipping_contacts: [], suscriptions: []
end
