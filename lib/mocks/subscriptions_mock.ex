defmodule Mocks.SubscriptionsMock do
    @moduledoc false

    def get_create_mock, do: {:ok, subscription_response("active")}
    def get_get_mock, do: {:ok, subscription_response("active")}
    def get_update_mock, do: {:ok, subscription_response("active")}
    def get_pause_mock, do: {:ok, subscription_response("paused")}
    def get_resume_mock, do: {:ok, subscription_response("active")}
    def get_cancel_mock, do: {:ok, subscription_response("canceled")}

    defp subscription_response(status) do
      %HTTPoison.Response{
        body: Poison.encode!(%{
          id: "sub_1",
          object: "subscription",
          status: status,
          plan_id: "plan_1",
          card_id: "card_1",
          customer_id: "cus_1",
          created_at: 1_495_406_544,
          subscription_start: 1_495_406_544,
          billing_cycle_start: 1_495_406_544,
          billing_cycle_end: 1_498_084_944
        }),
        headers: [
          {"Content-Type", "application/json; charset=utf-8"},
          {"Conekta-Media-Type", "conekta-v2.0.0; format=json"}
        ],
        status_code: 200
      }
    end
end
