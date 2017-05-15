defmodule Conekta.Orders do
  import Conekta.Wrapper
  alias Conekta.OrdersResponse
  alias Conekta.Handler

  def orders do
    Conekta.Client.get_request("orders")
    |> case do
        {:ok, content} ->
          body = Handler.handle_status_code(content)
          {:ok, Poison.decode!(body, as: %OrdersResponse{})}
    end
  end

end
