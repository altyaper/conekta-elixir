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
    defstruct currency: nil, customer_info: nil, line_items: nil, charges: nil
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

defmodule Conekta.PlansFindResponse do
    @moduledoc false
    defstruct id: nil, livemode: nil, object: nil, frequency: nil, interval: nil, currency: nil, amount: nil, name: nil, created_at: nil
end

