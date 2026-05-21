defmodule Mocks.PaymentLinksMock do
    @moduledoc false

    def get_create_mock, do: {:ok, checkout_response("Issued")}
    def get_list_mock, do: {:ok, checkouts_list_response()}
    def get_find_mock, do: {:ok, checkout_response("Issued")}
    def get_cancel_mock, do: {:ok, checkout_response("Cancelled")}
    def get_email_mock, do: {:ok, checkout_response("Issued")}
    def get_sms_mock, do: {:ok, checkout_response("Issued")}

    defp checkout_response(status) do
      %HTTPoison.Response{
        body: Poison.encode!(%{
          id: "checkout_1",
          name: "Test Payment",
          object: "checkout",
          livemode: false,
          status: status,
          type: "PaymentLink",
          url: "https://pay.conekta.com/checkout/checkout_1",
          slug: "checkout_1",
          recurrent: false,
          allowed_payment_methods: ["card", "cash"],
          emails_sent: 0,
          sms_sent: 0
        }),
        headers: [
          {"Content-Type", "application/json; charset=utf-8"},
          {"Conekta-Media-Type", "conekta-v2.0.0; format=json"}
        ],
        status_code: 200
      }
    end

    defp checkouts_list_response do
      %HTTPoison.Response{
        body: Poison.encode!(%{
          has_more: false,
          object: "list",
          data: [%{
            id: "checkout_1",
            name: "Test Payment",
            object: "checkout",
            status: "Issued"
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
