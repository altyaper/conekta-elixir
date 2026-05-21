defmodule Conekta.Subscriptions do
    @moduledoc """
      Functions for managing customer subscriptions.

      Endpoint: https://api.conekta.io/customers/{customer_id}/subscription
    """

    alias Conekta.Handler
    alias Conekta.Client
    alias Conekta.SubscriptionResponse

    @doc """
    Create a subscription for a customer
    [Conekta Documentation](https://developers.conekta.com/api#create-subscription)

    **Method**: `POST`

        Conekta.Subscriptions.create(customer_id, %Conekta.SubscriptionRequest{plan_id: "plan_123"})
        # => {:ok, %Conekta.SubscriptionResponse{}}
    """
    def create(customer_id, subscription) do
        case Client.post_request("customers/" <> customer_id <> "/subscription", subscription) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %SubscriptionResponse{})}
        end
    end

    @doc """
    Get a customer's subscription
    [Conekta Documentation](https://developers.conekta.com/api#subscription)

    **Method**: `GET`

        Conekta.Subscriptions.get(customer_id)
        # => {:ok, %Conekta.SubscriptionResponse{}}
    """
    def get(customer_id) do
        case Client.get_request("customers/" <> customer_id <> "/subscription") do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %SubscriptionResponse{})}
        end
    end

    @doc """
    Update a customer's subscription
    [Conekta Documentation](https://developers.conekta.com/api#update-subscription)

    **Method**: `PUT`

        Conekta.Subscriptions.update(customer_id, %Conekta.SubscriptionRequest{plan_id: "new_plan"})
        # => {:ok, %Conekta.SubscriptionResponse{}}
    """
    def update(customer_id, subscription) do
        case Client.put_request("customers/" <> customer_id <> "/subscription", subscription) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %SubscriptionResponse{})}
        end
    end

    @doc """
    Pause a customer's subscription

    **Method**: `POST`

        Conekta.Subscriptions.pause(customer_id)
        # => {:ok, %Conekta.SubscriptionResponse{}}
    """
    def pause(customer_id) do
        case Client.post_request("customers/" <> customer_id <> "/subscription/pause") do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %SubscriptionResponse{})}
        end
    end

    @doc """
    Resume a paused subscription

    **Method**: `POST`

        Conekta.Subscriptions.resume(customer_id)
        # => {:ok, %Conekta.SubscriptionResponse{}}
    """
    def resume(customer_id) do
        case Client.post_request("customers/" <> customer_id <> "/subscription/resume") do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %SubscriptionResponse{})}
        end
    end

    @doc """
    Cancel a customer's subscription

    **Method**: `POST`

        Conekta.Subscriptions.cancel(customer_id)
        # => {:ok, %Conekta.SubscriptionResponse{}}
    """
    def cancel(customer_id) do
        case Client.post_request("customers/" <> customer_id <> "/subscription/cancel") do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %SubscriptionResponse{})}
        end
    end
end
