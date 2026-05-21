defmodule Conekta.Charges do
    @moduledoc """
      Functions for listing and updating charges.

      Charges are created through orders (see `Conekta.Orders.create_charge/2`).
      This module provides standalone listing and updating.

      Endpoint: https://api.conekta.io/charges
    """

    alias Conekta.Handler
    alias Conekta.Client
    alias Conekta.ChargeResponse
    alias Conekta.ChargesResponse

    @doc """
    List all charges across all orders

    **Method**: `GET`

        Conekta.Charges.list()
        # => {:ok, %Conekta.ChargesResponse{}}
    """
    def list do
        case Client.get_request("charges") do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %ChargesResponse{})}
        end
    end

    @doc """
    Get a charge by ID

    **Method**: `GET`

        Conekta.Charges.find(charge_id)
        # => {:ok, %Conekta.ChargeResponse{}}
    """
    def find(charge_id) do
        case Client.get_request("charges/" <> charge_id) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %ChargeResponse{})}
        end
    end

    @doc """
    Update a charge's reference ID

    **Method**: `PUT`

        Conekta.Charges.update(charge_id, %Conekta.ChargeUpdateRequest{reference_id: "ref_123"})
        # => {:ok, %Conekta.ChargeResponse{}}
    """
    def update(charge_id, charge) do
        case Client.put_request("charges/" <> charge_id, charge) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %ChargeResponse{})}
        end
    end
end
