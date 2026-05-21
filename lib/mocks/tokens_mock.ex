defmodule Mocks.TokensMock do
    @moduledoc false

    def get_create_mock, do: {:ok, token_response()}

    defp token_response do
      %HTTPoison.Response{
        body: Poison.encode!(%{
          id: "tok_test_visa_4242",
          object: "token",
          livemode: false,
          used: false
        }),
        headers: [
          {"Content-Type", "application/json; charset=utf-8"},
          {"Conekta-Media-Type", "conekta-v2.0.0; format=json"}
        ],
        status_code: 200
      }
    end
end
