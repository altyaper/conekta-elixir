defmodule Conekta.Order do
  defstruct currency: nil,
    customer_info: %{customer_id: nil},
    line_items: [%{
    name: nil,
    unit_price: nil,
    quantity: nil
    }],
    charges: [%{
      payment_method: %{
        type: nil
      }
    }]
end
