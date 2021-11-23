defmodule Conekta.Customers do
  @moduledoc """
    Functions for retrieving and managing information about clients.

    We can create, update, find, delete and get all customers:

    Endpoint: https://api.conekta.io/customers
  """

  alias Conekta.Client
  alias Conekta.Customer
  alias Conekta.CustomerCreatePaymentSourceResponse
  alias Conekta.CustomerCreateShippingContactResponse
  alias Conekta.CustomerDeletePaymentSourceResponse
  alias Conekta.CustomerDeleteResponse
  alias Conekta.CustomerDeleteShippingContactResponse
  alias Conekta.CustomerFindResponse
  alias Conekta.CustomerPaymentSourcesResponse
  alias Conekta.CustomerShippingContactsResponse
  alias Conekta.CustomersResponse
  alias Conekta.CustomerSubscriptionResponse
  alias Conekta.CustomerUpdateShippingContactResponse
  alias Conekta.Handler

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

      Conekta.Customers.find(client_id)
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

      Conekta.Customers.delete(client_id)
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

      Conekta.Customers.update(client_id, %Conekta.Customer{})
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

      Conekta.Customers.subscription(client_id)
      # => { :ok, %Conekta.CustomerSubscriptionResponse{}}
  """
  def subscription(client_id) do
    case Client.get_request("customers/" <> client_id <> "/subscription") do
      {:ok, content} ->
        body = Handler.handle_status_code(content)
        {:ok, Poison.decode!(body, as: %CustomerSubscriptionResponse{})}
    end
  end

  @doc """
  Get the client payment sources
  [Conekta Documenation](https://developers.conekta.com/api?language=node#payment-source)

  **Method**: `GET`

      Conekta.Customers.payment_sources(client_id)
      # => { :ok, %Conekta.CustomerPaymentSourcesResponse{}}
  """
  def payment_sources(client_id) do
    case Client.get_request("customers/" <> client_id <> "/payment_sources") do
      {:ok, content} ->
        body = Handler.handle_status_code(content)
        {:ok, Poison.decode!(body, as: %CustomerPaymentSourcesResponse{})}
    end
  end

  @doc """
  Create a new payment source
  [Conekta Documenation](https://developers.conekta.com/api?language=bash#create-payment-source)

  **Method**: `POST`

      Conekta.Customers.create_payment_source(client_id, %Conekta.PaymentSource{})
      # => { :ok, %Conekta.CustomerCreatePaymentSourceResponse{}}
  """
  def create_payment_source(client_id, payment_source) do
    case Client.post_request(
           "customers/" <> client_id <> "/payment_sources",
           payment_source
         ) do
      {:ok, content} ->
        body = Handler.handle_status_code(content)
        {:ok, Poison.decode!(body, as: %CustomerCreatePaymentSourceResponse{})}
    end
  end

  @doc """
  Delete a payment source from a client
  [Conekta Documenation](https://developers.conekta.com/api?language=bash#delete-payment-source)

  **Method**: `DELETE`

      Conekta.Customers.delete_payment_source(client_id, payment_source_id)
      # => { :ok, %Conekta.CustomerDeletePaymentSourceResponse{}}
  """
  def delete_payment_source(client_id, payment_source_id) do
    case Client.delete_request(
           "customers/" <> client_id <> "/payment_sources/" <> payment_source_id
         ) do
      {:ok, content} ->
        body = Handler.handle_status_code(content)
        {:ok, Poison.decode!(body, as: %CustomerDeletePaymentSourceResponse{})}
    end
  end

  @doc """
  Get the client shipping contacts
  [Conekta Documenation](https://developers.conekta.com/api?language=node#shipping-contact)

  **Method**: `GET`

      Conekta.Customers.shipping_contacts(client_id)
      # => { :ok, %Conekta.CustomerShippingContactsResponse{}}
  """
  def shipping_contacts(client_id) do
    case Client.get_request("customers/" <> client_id <> "/shipping_contacts") do
      {:ok, content} ->
        body = Handler.handle_status_code(content)
        {:ok, Poison.decode!(body, as: %CustomerShippingContactsResponse{})}
    end
  end

  @doc """
  Create a new shipping contact for a customer
  [Conekta Documenation](https://developers.conekta.com/api?language=bash#create-shipping-contact-customer)

  **Method**: `POST`

      Conekta.Customers.create_shipping_contact(client_id, %Conekta.ShippingContact{})
      # => { :ok, %Conekta.CustomerCreateShippingContactResponse{}}
  """
  def create_shipping_contact(client_id, shipping_contact) do
    case Client.post_request(
           "customers/" <> client_id <> "/shipping_contacts",
           shipping_contact
         ) do
      {:ok, content} ->
        body = Handler.handle_status_code(content)

        {:ok,
         Poison.decode!(body, as: %CustomerCreateShippingContactResponse{})}
    end
  end

  @doc """
  Update shipping contact for a customer
  [Conekta Documenation](https://developers.conekta.com/api?language=bash#update-shipping-contact)

  **Method**: `PUT`

      Conekta.Customers.update_shipping_contact(client_id, shipping_contact_id, %Conekta.ShippingContact{})
      # => { :ok, %Conekta.CustomerUpdateShippingContactResponse{}}
  """
  def update_shipping_contact(client_id, shipping_contact_id, shipping_contact) do
    case Client.put_request(
           "customers/" <>
             client_id <> "/shipping_contacts/" <> shipping_contact_id,
           shipping_contact
         ) do
      {:ok, content} ->
        body = Handler.handle_status_code(content)

        {:ok,
         Poison.decode!(body, as: %CustomerUpdateShippingContactResponse{})}
    end
  end

  @doc """
  Delete a shipping contact from a customer
  [Conekta Documenation](https://developers.conekta.com/api?language=bash#delete-shipping-contact)

  **Method**: `DELETE`

      Conekta.Customers.delete_shipping_contact(client_id, shipping_contact_id)
      # => { :ok, %Conekta.CustomerDeleteShippingContactResponse{}}
  """
  def delete_shipping_contact(client_id, shipping_contact_id) do
    case Client.delete_request(
           "customers/" <>
             client_id <> "/shipping_contacts/" <> shipping_contact_id
         ) do
      {:ok, content} ->
        body = Handler.handle_status_code(content)

        {:ok,
         Poison.decode!(body, as: %CustomerDeleteShippingContactResponse{})}
    end
  end
end
