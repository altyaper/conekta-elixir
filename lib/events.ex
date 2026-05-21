defmodule Conekta.Events do
    @moduledoc """
      Functions for retrieving and resending webhook events.

      Events are created automatically when actions occur in your
      Conekta account (e.g., a charge is paid, an order is created).

      Endpoint: https://api.conekta.io/events
    """

    alias Conekta.Handler
    alias Conekta.Client
    alias Conekta.EventResponse
    alias Conekta.EventsResponse
    alias Conekta.EventResendResponse

    @doc """
    List all events

    **Method**: `GET`

        Conekta.Events.list()
        # => {:ok, %Conekta.EventsResponse{}}
    """
    def list do
        case Client.get_request("events") do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %EventsResponse{})}
        end
    end

    @doc """
    Get an event by ID

    **Method**: `GET`

        Conekta.Events.find(event_id)
        # => {:ok, %Conekta.EventResponse{}}
    """
    def find(event_id) do
        case Client.get_request("events/" <> event_id) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %EventResponse{})}
        end
    end

    @doc """
    Resend an event to its webhook endpoint

    **Method**: `POST`

        Conekta.Events.resend(event_id, webhook_log_id)
        # => {:ok, %Conekta.EventResendResponse{}}
    """
    def resend(event_id, webhook_log_id) do
        case Client.post_request("events/" <> event_id <> "/resend", %{webhook_log_id: webhook_log_id}) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %EventResendResponse{})}
        end
    end
end
