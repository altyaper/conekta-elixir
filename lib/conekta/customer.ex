defmodule Conekta.Customer do
  @derive [Poison.Encoder]
  defstruct id: nil, name: nil, phone: nil, email: nil, plan_id: nil,
  payment_sources: [%{token_id: nil, type: nil}], corporate: false,
  shipping_contacts: [], suscriptions: []
end
