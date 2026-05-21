defmodule Mocks.WebhooksMock do
    @moduledoc false

    def get_create_mock, do: {:ok, webhook_response()}
    def get_list_mock, do: {:ok, webhooks_list_response()}
    def get_find_mock, do: {:ok, webhook_response()}
    def get_update_mock, do: {:ok, webhook_response()}
    def get_delete_mock, do: {:ok, webhook_response()}
    def get_test_mock, do: {:ok, webhook_response()}

    defp webhook_response do
      %HTTPoison.Response{
        body: Poison.encode!(%{
          id: "wh_1",
          object: "webhook",
          url: "https://example.com/webhook",
          status: "ready",
          active: true,
          livemode: false,
          description: "Test webhook",
          subscribed_events: ["charge.paid", "order.created"]
        }),
        headers: [
          {"Content-Type", "application/json; charset=utf-8"},
          {"Conekta-Media-Type", "conekta-v2.0.0; format=json"}
        ],
        status_code: 200
      }
    end

    defp webhooks_list_response do
      %HTTPoison.Response{
        body: Poison.encode!(%{
          has_more: false,
          object: "list",
          data: [%{
            id: "wh_1",
            object: "webhook",
            url: "https://example.com/webhook",
            status: "ready",
            active: true
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
