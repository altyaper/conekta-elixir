defmodule Mocks.EventsMock do
    @moduledoc false

    def get_list_mock, do: {:ok, events_list_response()}
    def get_find_mock, do: {:ok, event_response()}
    def get_resend_mock, do: {:ok, resend_response()}

    defp event_response do
      %HTTPoison.Response{
        body: Poison.encode!(%{
          id: "evt_1",
          object: "event",
          type: "charge.paid",
          livemode: false,
          created_at: 1_495_406_544,
          data: %{object: %{id: "chr_1"}},
          webhook_status: "successful",
          webhook_logs: [%{id: "whl_1", url: "https://example.com/webhook"}]
        }),
        headers: [
          {"Content-Type", "application/json; charset=utf-8"},
          {"Conekta-Media-Type", "conekta-v2.0.0; format=json"}
        ],
        status_code: 200
      }
    end

    defp events_list_response do
      %HTTPoison.Response{
        body: Poison.encode!(%{
          has_more: false,
          object: "list",
          data: [%{
            id: "evt_1",
            object: "event",
            type: "charge.paid",
            livemode: false,
            created_at: 1_495_406_544
          }]
        }),
        headers: [
          {"Content-Type", "application/json; charset=utf-8"},
          {"Conekta-Media-Type", "conekta-v2.0.0; format=json"}
        ],
        status_code: 200
      }
    end

    defp resend_response do
      %HTTPoison.Response{
        body: Poison.encode!(%{
          id: "whl_1",
          url: "https://example.com/webhook",
          failed_attempts: 0,
          last_attempted_at: 1_495_406_600,
          last_http_response_status: 200
        }),
        headers: [
          {"Content-Type", "application/json; charset=utf-8"},
          {"Conekta-Media-Type", "conekta-v2.0.0; format=json"}
        ],
        status_code: 200
      }
    end
end
