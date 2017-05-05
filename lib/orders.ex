defmodule Conekta.Orders do
  import Conekta.Wrapper
  alias Conekta.Order
  alias Conekta.OrderResponse
  @conekta_accept_header "application/vnd.conekta-v2.0.0+json"

  def orders do
    get("orders", ["Accept": @conekta_accept_header, "Content-type": "application/json"], [hackney: Conekta.Wrapper.auth()])
    |> case do
        {:ok, content} ->
          orders = Poison.decode(content.body, as: %OrderResponse{})
          {:ok, orders}
        {:error, reason} -> {:error, reason}
    end
  end

  def create_order(order) do
    body = Poison.encode!(order, as: Order)
    IO.inspect body
    IO.puts "\n"
    post("orders", body,["Accept": @conekta_accept_header, "Content-type": "application/json"], [hackney: Conekta.Wrapper.auth()])
    |> case do
      {:ok, content} -> {:ok, content}
      {:error, reason} -> {:error, reason}
    end
  end

end
