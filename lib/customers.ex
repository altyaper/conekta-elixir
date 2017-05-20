defmodule Conekta.Customers do

   @moduledoc """
      Functions for retrieving information about clients and for
      managing clients too.

      We can create, edit, find, delete and get all customers:
          Conekta.Customers.customer() # get all customers
          Conekta.Customers.find("cus_2gXuVHVD7n9ewPda4") # get a client by passing its ID
      Endpoing: https://api.conekta.io/customers
    """


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

  def create(customer) do
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

  def update(id, customer) do
    Conekta.Client.put_request("customers/" <> id, customer)
    |> case do
      {:ok, content} ->
        body = Handler.handle_status_code(content)
        {:ok, Poison.decode!(body, as: %CustomerUpdateResponse{})}
      end
  end

end
