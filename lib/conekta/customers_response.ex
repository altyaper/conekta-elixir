defmodule Conekta.CustomersResponse do
  defstruct has_more: nil, total: nil, object: nil, data: [%{
    livemode: nil,
    name: nil,
    email: nil,
    id: nil,
    object: nil,
    customer: nil,
    parent_id: nil,
    default: nil
  }]
end
