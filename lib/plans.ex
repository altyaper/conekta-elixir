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
    alias Conekta.PlanDeleteResponse

    @doc """
    Get all the current plans
    [Conekta Documenation](https://developers.conekta.com/api?#plan)

    **Method**: `GET`

        Conekta.Plans.plans()
        # => { :ok, %Conekta.PlansResponse{}}
    """
    def plans do
        case Client.get_request("plans") do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %PlansResponse{})}
      end
    end

    @doc """
    Get a plan by passing the unique ID

    **Method**: `GET`

        Conekta.Plans.find(id)
        # => { :ok, %Conekta.PlanFindResponse{}}
    """
    def find(id) do
        case Client.get_request("plans/" <> id) do
            {:ok, content} ->
               body = Handler.handle_status_code(content)
               {:ok, Poison.decode!(body, as: %PlanFindResponse{})}
        end
    end

    @doc """
    Update a plan by passing a %Conekta.PlanUpdateResponse{} struct with the new data
    [Conekta Documentation](https://developers.conekta.com/api?#update-plan)

    **Method**: `PUT`

        Conekta.Plans.update(%Conekta.Plan{})
        # => { :ok, %Conekta.PlanUpdateResponse{}}
    """
    def update(id, plan) do
        case Client.put_request("plans/" <> id, plan) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %PlanUpdateResponse{})}
        end
    end

    @doc """
    Delete a plan by passing a unique ID
    [Conekta Documentation](https://developers.conekta.com/api?#delete-plan)

    **Method**: `DELETE`

        Conekta.Plans.delete(id)
        # => { :ok, %Conekta.PlanDeleteResponse{}}
    """
    def delete(id) do
        case Client.delete_request("plans/" <> id) do
            {:ok, content} ->
                body = Handler.handle_status_code(content)
                {:ok, Poison.decode!(body, as: %PlanDeleteResponse{})}
        end
    end

end