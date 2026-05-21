defmodule Conekta.Webhooks do
    @moduledoc """
      Functions for managing webhook endpoints.

      Endpoint: https://api.conekta.io/webhooks
    """

    alias Conekta.Handler
    alias Conekta.Client
    alias Conekta.WebhookResponse
    alias Conekta.WebhooksResponse

    @doc """
    Create a new webhook endpoint
    [Conekta Documentation](https://developers.conekta.com/api#create-webhook)

    **Method**: `POST`

        Conekta.Webhooks.create(%Conekta.WebhookRequest{url: "https://example.com/webhook"})
        # => {:ok, %Conekta.WebhookResponse{}}
    """
    def create(webhook) do
        case Client.post_request("webhooks", webhook) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %WebhookResponse{})}
        end
    end

    @doc """
    List all webhook endpoints

    **Method**: `GET`

        Conekta.Webhooks.list()
        # => {:ok, %Conekta.WebhooksResponse{}}
    """
    def list do
        case Client.get_request("webhooks") do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %WebhooksResponse{})}
        end
    end

    @doc """
    Get a webhook endpoint by ID

    **Method**: `GET`

        Conekta.Webhooks.find(webhook_id)
        # => {:ok, %Conekta.WebhookResponse{}}
    """
    def find(webhook_id) do
        case Client.get_request("webhooks/" <> webhook_id) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %WebhookResponse{})}
        end
    end

    @doc """
    Update a webhook endpoint
    [Conekta Documentation](https://developers.conekta.com/api#update-webhook)

    **Method**: `PUT`

        Conekta.Webhooks.update(webhook_id, %Conekta.WebhookUpdateRequest{url: "https://new-url.com"})
        # => {:ok, %Conekta.WebhookResponse{}}
    """
    def update(webhook_id, webhook) do
        case Client.put_request("webhooks/" <> webhook_id, webhook) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %WebhookResponse{})}
        end
    end

    @doc """
    Delete a webhook endpoint

    **Method**: `DELETE`

        Conekta.Webhooks.delete(webhook_id)
        # => {:ok, %Conekta.WebhookResponse{}}
    """
    def delete(webhook_id) do
        case Client.delete_request("webhooks/" <> webhook_id) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %WebhookResponse{})}
        end
    end

    @doc """
    Send a test event to a webhook endpoint

    **Method**: `POST`

        Conekta.Webhooks.test(webhook_id)
        # => {:ok, %Conekta.WebhookResponse{}}
    """
    def test(webhook_id) do
        case Client.post_request("webhooks/" <> webhook_id <> "/test") do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %WebhookResponse{})}
        end
    end
end
