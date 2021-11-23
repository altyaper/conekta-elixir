defmodule Conekta.Checkouts do
  alias Conekta.Client
  alias Conekta.Handler

  def create_payment_link(payment_link) do
    case Client.post_request("checkouts/", payment_link) do
      {:ok, content} ->
        body = Handler.handle_status_code(content)
        {:ok, Poison.decode!(body)}
    end
  end
end
