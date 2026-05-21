defmodule Mocks.BalancesMock do
    @moduledoc false

    def get_balance_mock, do: {:ok, balance_response()}

    defp balance_response do
      %HTTPoison.Response{
        body: Poison.encode!(%{
          available: [%{amount: 150_000, currency: "MXN"}],
          pending: [%{amount: 50_000, currency: "MXN"}],
          retained: [%{amount: 0, currency: "MXN"}],
          gateway: [%{available: 150_000, pending: 50_000, currency: "MXN"}],
          cashout_retention_amount: [%{amount: 0, currency: "MXN"}],
          conekta_retention: [%{amount: 0, currency: "MXN"}],
          retention_amount: [%{amount: 0, currency: "MXN"}],
          target_retention_amount: [%{amount: 0, currency: "MXN"}],
          target_collateral_amount: [%{amount: 0, currency: "MXN"}],
          temporarily_retained: [%{amount: 0, currency: "MXN"}]
        }),
        headers: [
          {"Content-Type", "application/json; charset=utf-8"},
          {"Conekta-Media-Type", "conekta-v2.0.0; format=json"}
        ],
        status_code: 200
      }
    end
end
