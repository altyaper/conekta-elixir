defmodule Conekta.Customers do
  import Conekta.Wrapper
  alias Conekta.Customer
  alias Conekta.CustomerResponse
  @conekta_accept_header "application/vnd.conekta-v2.0.0+json"

  def customers do
    value = Application.get_env(:conekta, :publickey)
    get("customers", [], [hackney: Conekta.Wrapper.auth()])
    |> case do
      {:ok, content} ->
        obj = Poison.decode!(content.body, as: [%CustomerResponse{}])
        {:ok, obj}
      {:error, reason} -> raise reason
    end
  end

  def create_customer(customer) do
    body = Poison.encode!(customer, as: Customer, strict_keys: true) |> remove_empty
    response = post("customers", body,["Accept": @conekta_accept_header, "Content-type": "application/json"], [hackney: Conekta.Wrapper.auth()])
    case response do
      {:ok, content} ->
        obj = Poison.decode!(content.body, as: %CustomerResponse{})
        {:ok, obj}
      {:error, reason} -> raise reason
    end
  end

  defp remove_empty(json_string) do
    a = Regex.replace(~r/\"([^\"]+)\":null(,?)/, json_string, "")
  end

end
