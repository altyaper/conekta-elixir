defmodule Conekta.Orders do

    @moduledoc """
      Functions for retrieving and managing information about orders.

      We can create, update, find and get all orders:

      Endpoint: https://api.conekta.io/orders
    """
    alias Conekta.Client
    alias Conekta.Handler
    alias Conekta.OrdersResponse
    alias Conekta.OrdersCreateResponse
    alias Conekta.OrdersFindResponse
    alias Conekta.OrderChargesResponse

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
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %OrdersCreateResponse{})}
        end
    end


    @doc """
    Finds an order by passing the unique order ID

    **Method**: `GET`

        Conekta.Orders.find(client_id)
        # => { :ok, %Conekta.OrdersFindResponse{}}
    """
    def find(client_id) do
        case Client.get_request("orders/" <> client_id) do
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
    def update(client_id, order) do
        case Client.put_request("orders/" <> client_id, order) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body)}
        end
    end

    def charges(client_id) do
      case Client.get_request("orders/" <> client_id <> "/charges") do
        {:ok, content} ->
            body = Handler.handle_status_code(content)
            {:ok, Poison.decode!(body, as: %OrderChargesResponse{})}
      end
    end

end
