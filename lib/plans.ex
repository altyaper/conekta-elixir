defmodule Conekta.Plans do
    @moduledoc """
      Functions for retrieving and managing information about plans.

      We can create, update, find and get all orders:

      Endpoint: https://api.conekta.io/plans
    """

    alias Conekta.Handler
    alias Conekta.Client
    alias Conekta.PlansResponse
    alias Conekta.PlanFindResponse
    alias Conekta.PlanUpdateResponse

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

    **Method**: `GET`

        Conekta.Plans.find(id)
        # => { :ok, %Conekta.PlansFindResponse{}}
    """
    def find(id) do
        Client.get_request("plans/"<>id)
        |> case do
            {:ok, content} ->
               body = Handler.handle_status_code(content)
               {:ok, Poison.decode!(body, as: %PlanFindResponse{})}
        end
    end

    def update(id, plan) do
      Client.put_request("plans/"<>id, plan)
      |> case do
        {:ok, content} ->
            body = Handler.handle_status_code(content)
           {:ok, Poison.decode!(body, as: %PlanUpdateResponse{})}
      end
    end

end