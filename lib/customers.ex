defmodule Conekta.Customers do
  alias Conekta.Customer
  alias Conekta.CustomersResponse
  alias Conekta.Handler
  alias Conekta.CustomerFindResponse
  alias Conekta.CustomerDeleteResponse

  def customers do
    Conekta.Client.get_request("customers")
    |> case do
      {:ok, content} ->
        body = Handler.handle_status_code(content)
        {:ok, Poison.decode!(body, as: %CustomersResponse{})}
    end
  end

  def create_customer(customer) do
    Conekta.Client.post_request("customers", customer)
    |> case do
      {:ok, content} ->
        body = Handler.handle_status_code(content)
        {:ok, Poison.decode!(body, as: %Customer{})}
      end
  end

  def find(id) do
    Conekta.Client.get_request("customers/" <> id)
    |> case do
      {:ok, content} ->
        body = Handler.handle_status_code(content)
        {:ok, Poison.decode!(body, as: %CustomerFindResponse{})}
      end
  end

  def delete(id) do
    Conekta.Client.delete_request("customers/" <> id)
    |> case do
      {:ok, content} ->
        body = Handler.handle_status_code(content)
        {:ok, Poison.decode!(body, as: %CustomerDeleteResponse{})}
      end
  end

end
