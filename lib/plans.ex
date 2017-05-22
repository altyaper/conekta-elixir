defmodule Conekta.Plans do
    @moduledoc """
      Functions for retrieving and managing information about plans.

      We can create, update, find and get all orders:

      Endpoint: https://api.conekta.io/plans
    """

    alias Conekta.Handler
    alias Conekta.Client
    alias Conekta.PlansResponse
    alias Conekta.PlansFindResponse

    @doc """
    Get all the current plans
    [Conekta Documenation](https://developers.conekta.com/api?#plan)

    **Method**: `GET`

        Conekta.Plans.plans()
        # => { :ok, %Conekta.PlansResponse{}}
    """
    def plans do
        Client.get_request("plans")
        |> case do
        {:ok, content} ->
            body = Handler.handle_status_code(content)
            {:ok, Poison.decode!(body, as: %PlansResponse{})}
      end
    end

    @doc """
    Get a plan by passing the unique ID
    [Conekta Documenation](https://developers.conekta.com/api?#plan)

    **Method**: `GET`

        Conekta.Plans.find(id)
        # => { :ok, %Conekta.PlansFindResponse{}}
    """
    def find(id) do
        Client.get_request("plans/"<>id)
        |> case do
            {:ok, content} ->
               body = Handler.handle_status_code(content)
               {:ok, Poison.decode!(body, as: %PlansFindResponse{})}
        end
    end

end