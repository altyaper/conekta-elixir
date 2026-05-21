defmodule Conekta.Balances do
    @moduledoc """
      Functions for retrieving account balance information.

      Endpoint: https://api.conekta.io/balance
    """

    alias Conekta.Handler
    alias Conekta.Client
    alias Conekta.BalanceResponse

    @doc """
    Get the current account balance

    **Method**: `GET`

        Conekta.Balances.get()
        # => {:ok, %Conekta.BalanceResponse{}}
    """
    def get do
        case Client.get_request("balance") do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %BalanceResponse{})}
        end
    end
end
