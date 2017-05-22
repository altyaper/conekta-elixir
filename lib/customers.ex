defmodule Conekta.Customers do

    @moduledoc """
      Functions for retrieving and managing information about clients.

      We can create, update, find, delete and get all customers:

      Endpoint: https://api.conekta.io/customers
    """

    alias Conekta.Client
    alias Conekta.Customer
    alias Conekta.CustomersResponse
    alias Conekta.Handler
    alias Conekta.CustomerFindResponse
    alias Conekta.CustomerDeleteResponse
    alias Conekta.CustomerSubscriptionResponse
    alias Conekta.CustomerPaymentSourcesResponse
    alias Conekta.CustomerShippingContactsResponse


    @doc """
    Get Conekta clients information.
    [Conekta Documenation](https://developers.conekta.com/api?language=bash#customer)

    **Method**: `GET`

        Conekta.Customers.customers()
        # => { :ok, %Conekta.CustomersResponse{}}
    """
    def customers do
        case Client.get_request("customers") do
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
        case Client.post_request("customers", customer) do
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
    def find(client_id) do
        case Client.get_request("customers/" <> client_id) do
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
    def delete(client_id) do
        case Client.delete_request("customers/" <> client_id) do
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
    def update(client_id, customer) do
        case Client.put_request("customers/" <> client_id, customer) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %CustomerUpdateResponse{})}
        end
    end

    @doc """
    Get the client subscriptions
    [Conekta Documenation](https://developers.conekta.com/api?language=node#subscription)

    **Method**: `GET`

        Conekta.Customers.subscription(id)
        # => { :ok, %Conekta.CustomerSubscriptionResponse{}}
    """
    def subscription(client_id) do
        case Client.get_request("customers/" <> client_id <> "/subscription") do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %CustomerSubscriptionResponse{})}
        end
    end

    def payment_sources(client_id) do
      case Client.get_request("customers/" <> client_id <> "/payment_sources") do
        {:ok, content} ->
            body = Handler.handle_status_code(content)
            {:ok, Poison.decode!(body, as: %CustomerPaymentSourcesResponse{})}
      end
    end

    def shipping_contacts(client_id) do
      case Client.get_request("customers/" <> client_id <> "/shipping_contacts") do
        {:ok, content} ->
            body = Handler.handle_status_code(content)
            {:ok, Poison.decode!(body, as: %CustomerShippingContactsResponse{})}
      end
    end

end
