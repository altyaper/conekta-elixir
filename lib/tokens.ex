defmodule Conekta.Tokens do
    @moduledoc """
      Functions for tokenizing card data.

      Tokens are single-use references to card details that can be
      used to create payment sources without handling raw card numbers.

      Endpoint: https://api.conekta.io/tokens
    """

    alias Conekta.Handler
    alias Conekta.Client
    alias Conekta.TokenResponse

    @doc """
    Create a token from card details
    [Conekta Documentation](https://developers.conekta.com/api#create-token)

    **Method**: `POST`

        token = %Conekta.Token{
          card: %Conekta.TokenCard{
            number: "4242424242424242",
            name: "John Doe",
            exp_month: "12",
            exp_year: "25",
            cvc: "123"
          }
        }
        Conekta.Tokens.create(token)
        # => {:ok, %Conekta.TokenResponse{}}
    """
    def create(token) do
        case Client.post_request("tokens", token) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %TokenResponse{})}
        end
    end
end
