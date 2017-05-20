defmodule Conekta.CustomerDeleteResponse do
  @moduledoc false
  defstruct id: nil, name: nil, email: nil, phone: nil, livemode: nil, object: nil, created_at: nil, corporate: nil, delete: nil
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
    defstruct currency: nil, customer_info: nil, line_items: nil, charges: nil
end

defmodule Conekta.OrdersResponse do
    @moduledoc false
    defstruct has_more: nil, total: nil, object: nil, data: nil
end
