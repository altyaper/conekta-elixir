defmodule Mocks.ChargesMock do
    @moduledoc false

    def get_list_mock, do: {:ok, charges_list_response()}
    def get_find_mock, do: {:ok, charge_response()}
    def get_update_mock, do: {:ok, charge_response()}

    defp charge_response do
      %HTTPoison.Response{
        body: Poison.encode!(%{
          id: "chr_1",
          object: "charge",
          status: "paid",
          amount: 35_000,
          currency: "MXN",
          order_id: "ord_1",
          customer_id: "cus_1",
          livemode: false,
          created_at: 1_495_406_544,
          paid_at: 1_495_406_550,
          reference_id: "ref_123"
        }),
        headers: [
          {"Content-Type", "application/json; charset=utf-8"},
          {"Conekta-Media-Type", "conekta-v2.0.0; format=json"}
        ],
        status_code: 200
      }
    end

    defp charges_list_response do
      %HTTPoison.Response{
        body: Poison.encode!(%{
          has_more: false,
          object: "list",
          data: [%{
            id: "chr_1",
            object: "charge",
            status: "paid",
            amount: 35_000,
            currency: "MXN"
          }]
        }),
        headers: [
          {"Content-Type", "application/json; charset=utf-8"},
          {"Conekta-Media-Type", "conekta-v2.0.0; format=json"}
        ],
        status_code: 200
      }
    end
end
