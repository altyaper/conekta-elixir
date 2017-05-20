defmodule Conekta.Orders do
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

  def create(order) when is_map(order) do
    Conekta.Client.post_request("orders", order)
    |> case do
        {:ok, content} ->
          body = Handler.handle_status_code(content)
          {:ok, Poison.decode!(body, as: %OrdersResponse{})}
    end
  end

end
