defmodule ConektaTest.PlansIntegrationTest do
  @moduledoc """
  Integration tests against Conekta's sandbox API.
  Requires CONEKTA_PRIVATE_KEY env var to be set.

  Run with: mix test test/integration --include integration
  """

  use ExUnit.Case, async: false

  @moduletag :integration

  setup do
    key = System.get_env("CONEKTA_PRIVATE_KEY")

    if is_nil(key) do
      raise "CONEKTA_PRIVATE_KEY environment variable is not set"
    end

    Conekta.Wrapper.put_config(%{
      privatekey: key,
      locale: "es",
      apiversion: "2.0.0"
    })

    :ok
  end

  describe "Plans lifecycle" do
    test "create, find, update, and delete a plan" do
      # Create
      plan = %Conekta.Plan{
        name: "Test Plan #{System.unique_integer([:positive])}",
        amount: 5000,
        currency: "MXN",
        interval: "month",
        frequency: 1
      }

      {:ok, created} = Conekta.Plans.create(plan)
      assert created.id != nil
      assert created.amount == 5000
      assert created.currency == "MXN"

      # Find
      {:ok, found} = Conekta.Plans.find(created.id)
      assert found.id == created.id
      assert found.name == created.name

      # Update
      {:ok, updated} = Conekta.Plans.update(created.id, %Conekta.Plan{name: "Updated Plan"})
      assert updated.name == "Updated Plan"

      # Delete
      {:ok, deleted} = Conekta.Plans.delete(created.id)
      assert deleted.id == created.id
    end
  end
end
