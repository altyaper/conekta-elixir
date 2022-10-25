defmodule Conekta.Orders do
  @moduledoc """
    Functions for retrieving and managing information about orders.

    We can create, update, find and get all orders:

    Endpoint: https://api.conekta.io/orders
  """
  alias Conekta.Client
  alias Conekta.Handler
  alias Conekta.OrderChargesResponse
  alias Conekta.OrderCreateChargeResponse
  alias Conekta.OrdersCreateResponse
  alias Conekta.OrdersFindResponse
  alias Conekta.OrdersResponse

  @doc """
  Get all the current orders
  [Conekta Documenation](https://developers.conekta.com/api#order)

  **Method**: `GET`

      Conekta.Orders.orders()
      # => { :ok, %Conekta.OrdersResponse{}}
  """
  def orders do
    case Client.get_request("orders") do
      {:ok, content} ->
        body = Handler.handle_status_code(content)
        {:ok, Poison.decode!(body, as: %OrdersResponse{})}
    end
  end

  @doc """
  Create a new order by passing a %Conekta.Order{} struct
  [Conekta Documenation](https://developers.conekta.com/api#create-order)

  **Method**: `GET`

      Conekta.Orders.create(%Conekta.Order{})
      # => { :ok, %Conekta.OrdersCreateResponse{}}
  """
  def create(order) when is_map(order) do
    case Client.post_request("orders", order) do
      {:ok, content} ->
        content
        |> Handler.handle_status_code()
        |> Poison.decode!()
        |> parse_response()
    end
  end

  @doc """
  Finds an order by passing the unique order ID

  **Method**: `GET`

      Conekta.Orders.find(order_id)
      # => { :ok, %Conekta.OrdersFindResponse{}}
  """
  def find(order_id) do
    case Client.get_request("orders/" <> order_id) do
      {:ok, content} ->
        body = Handler.handle_status_code(content)
        {:ok, Poison.decode!(body, as: %OrdersFindResponse{})}
    end
  end

  @doc """
  Update an order by passing an %Conekta.Order{} object with the new modifications

  **Method**: `PUT`

      Conekta.Orders.update(client_id, %Conekta.Order{})
      # => { :ok, %{}}
  """
  def update(order_id, order) do
    case Client.put_request("orders/" <> order_id, order) do
      {:ok, content} ->
        body = Handler.handle_status_code(content)
        {:ok, Poison.decode!(body)}
    end
  end

  @doc """
  Get charges from an order

  **Method**: `GET`

      Conekta.Orders.charges(order_id)
      # => { :ok, %Conekta.OrderChargesResponse{}}
  """
  def charges(order_id) do
    case Client.get_request("orders/" <> order_id <> "/charges") do
      {:ok, content} ->
        body = Handler.handle_status_code(content)
        {:ok, Poison.decode!(body, as: %OrderChargesResponse{})}
    end
  end

  @doc """
  Creates a new charge for an existing order.

  **Method**: `POST`

      Conekta.Orders.create_charge(order_id, charge)
      # => { :ok, %Conekta.OrderCreateChargeResponse{}}
  """
  def create_charge(order_id, charge) do
    case Client.post_request("orders/" <> order_id <> "/charges", charge) do
      {:ok, content} ->
        content
        |> Handler.handle_status_code()
        |> Poison.decode!()
        |> parse_response()
    end
  end

  defp parse_response(%{"data" => %{"object" => "order"}  = data}) do
    data
    |> Poison.encode!()
    |> Poison.decode!(as: %OrdersCreateResponse{})
    |> then(&{:error, &1})
  end

  defp parse_response(%{"charges" => _charges} = data) do
    data
    |> Poison.encode!()
    |> Poison.decode!(as: %OrdersCreateResponse{})
    |> then(&{:ok, &1})
  end

  defp parse_response(data) do
    data
    |> Poison.encode!()
    |> Poison.decode!(as: %OrderCreateChargeResponse{})
    |> then(&{:ok, &1})
  end

  def refund(order_id, refund) do
    case Client.post_request("orders/" <> order_id <> "/refunds", refund) do
      {:ok, content} ->
        body = Handler.handle_status_code(content)
        {:ok, Poison.decode!(body)}
    end
  end

  def partial_refund(order_id, refund) do
    case Client.post_request("orders/" <> order_id <> "/refunds", refund) do
      {:ok, content} ->
        body = Handler.handle_status_code(content)
        {:ok, Poison.decode!(body)}
    end
  end
end
