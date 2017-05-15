defmodule Conekta.Customers do
  alias Conekta.Customer
  alias Conekta.CustomersResponse
  alias Conekta.Handler

  def customers do
    Conekta.Client.get_request("customers")
    |> case do
      {:ok, content} ->
        body = Handler.handle_status_code(content)
        {:ok, Poison.decode!(body, as: %CustomersResponse{})}
    end
  end


end
