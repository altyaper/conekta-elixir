defmodule Conekta.PaymentLinks do
    @moduledoc """
      Functions for creating and managing payment links (checkouts).

      Endpoint: https://api.conekta.io/checkouts
    """

    alias Conekta.Handler
    alias Conekta.Client
    alias Conekta.CheckoutResponse
    alias Conekta.CheckoutsResponse

    @doc """
    Create a new payment link
    [Conekta Documentation](https://developers.conekta.com/api#create-checkout)

    **Method**: `POST`

        Conekta.PaymentLinks.create(%Conekta.Checkout{})
        # => {:ok, %Conekta.CheckoutResponse{}}
    """
    def create(checkout) do
        case Client.post_request("checkouts", checkout) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %CheckoutResponse{})}
        end
    end

    @doc """
    List all payment links

    **Method**: `GET`

        Conekta.PaymentLinks.list()
        # => {:ok, %Conekta.CheckoutsResponse{}}
    """
    def list do
        case Client.get_request("checkouts") do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %CheckoutsResponse{})}
        end
    end

    @doc """
    Get a payment link by ID

    **Method**: `GET`

        Conekta.PaymentLinks.find(checkout_id)
        # => {:ok, %Conekta.CheckoutResponse{}}
    """
    def find(checkout_id) do
        case Client.get_request("checkouts/" <> checkout_id) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %CheckoutResponse{})}
        end
    end

    @doc """
    Cancel a payment link

    **Method**: `PUT`

        Conekta.PaymentLinks.cancel(checkout_id)
        # => {:ok, %Conekta.CheckoutResponse{}}
    """
    def cancel(checkout_id) do
        case Client.put_request("checkouts/" <> checkout_id <> "/cancel", %{}) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %CheckoutResponse{})}
        end
    end

    @doc """
    Send a payment link via email

    **Method**: `POST`

        Conekta.PaymentLinks.send_email(checkout_id, "customer@example.com")
        # => {:ok, %Conekta.CheckoutResponse{}}
    """
    def send_email(checkout_id, email) do
        case Client.post_request("checkouts/" <> checkout_id <> "/email", %{email: email}) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %CheckoutResponse{})}
        end
    end

    @doc """
    Send a payment link via SMS

    **Method**: `POST`

        Conekta.PaymentLinks.send_sms(checkout_id, "+521234567890")
        # => {:ok, %Conekta.CheckoutResponse{}}
    """
    def send_sms(checkout_id, phone) do
        case Client.post_request("checkouts/" <> checkout_id <> "/sms", %{phonenumber: phone}) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %CheckoutResponse{})}
        end
    end
end
