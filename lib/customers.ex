defmodule Conekta.Customers do

    @moduledoc """
      Functions for retrieving and managing information about clients.

      We can create, update, find, delete and get all customers:

      Endpoint: https://api.conekta.io/customers
    """

    alias Conekta.Customer
    alias Conekta.CustomersResponse
    alias Conekta.Handler
    alias Conekta.CustomerFindResponse
    alias Conekta.CustomerDeleteResponse


    @doc """
    Get Conekta clients information.
    [Conekta Documenation](https://developers.conekta.com/api?language=bash#customer)

    **Method**: `GET`

        Conekta.Customers.customers()
        # => { :ok, %Conekta.CustomersResponse{}}
    """
    def customers do
        Conekta.Client.get_request("customers")
        |> case do
          {:ok, content} ->
            body = Handler.handle_status_code(content)
            {:ok, Poison.decode!(body, as: %CustomersResponse{})}
        end
    end


    @doc """
    Create a new Conekta client
    [Conekta Documenation](https://developers.conekta.com/api?language=bash#create-customer)

    **Method**: `POST`

        Conekta.Customers.create(%Conekta.Customer{})
        # => { :ok, %Conekta.Customer{}}
    """
    def create(customer) do
        Conekta.Client.post_request("customers", customer)
        |> case do
          {:ok, content} ->
            body = Handler.handle_status_code(content)
            {:ok, Poison.decode!(body, as: %Customer{})}
          end
    end

    @doc """
    Get Conekta client information identified by their unique conekta ID.

    **Method**: `GET`

        Conekta.Customers.find("cus_2gXuVHVD7n9ewPda4")
        # => { :ok, %Conekta.CustomerFindResponse{}}
    """
    def find(id) do
        Conekta.Client.get_request("customers/" <> id)
        |> case do
          {:ok, content} ->
            body = Handler.handle_status_code(content)
            {:ok, Poison.decode!(body, as: %CustomerFindResponse{})}
          end
    end

    @doc """
    Delete a Conekta client by passing the unique conekta ID.
    [Conekta Documenation](https://developers.conekta.com/api?language=bash#delete-customer)

    **Method**: `DELETE`

        Conekta.Customers.delete("cus_2gXuVHVD7n9ewPda4")
        # => { :ok, %Conekta.CustomerDeleteResponse{}}
    """
    def delete(id) do
        Conekta.Client.delete_request("customers/" <> id)
        |> case do
          {:ok, content} ->
            body = Handler.handle_status_code(content)
            {:ok, Poison.decode!(body, as: %CustomerDeleteResponse{})}
          end
    end

    @doc """
    Update a Conekta client by passing a %Conekta.Customer{} struct with the new values
    [Conekta Documenation](https://developers.conekta.com/api?language=bash#update-customer)

    **Method**: `PUT`

        Conekta.Customers.update(%Conekta.Customer{})
        # => { :ok, %Conekta.CustomerDeleteResponse{}}
    """
    def update(id, customer) do
        Conekta.Client.put_request("customers/" <> id, customer)
        |> case do
          {:ok, content} ->
            body = Handler.handle_status_code(content)
            {:ok, Poison.decode!(body, as: %CustomerUpdateResponse{})}
          end
    end

end
