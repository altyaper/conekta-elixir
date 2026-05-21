defmodule ConektaTest.SubscriptionsIntegrationTest do
  @moduledoc """
  Integration tests for subscriptions against Conekta's sandbox.
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

  describe "Subscriptions lifecycle" do
    test "create, get, pause, resume, and cancel a subscription" do
      # Create a plan first
      plan = %Conekta.Plan{
        name: "Sub Test Plan #{System.unique_integer([:positive])}",
        amount: 3000,
        currency: "MXN",
        interval: "month",
        frequency: 1
      }
      {:ok, created_plan} = Conekta.Plans.create(plan)

      # Create a customer with a payment source
      customer = %Conekta.Customer{
        name: "Sub Test Customer",
        email: "sub_test_#{System.unique_integer([:positive])}@test.com",
        payment_sources: [%{
          token_id: "tok_test_visa_4242",
          type: "card"
        }]
      }
      {:ok, created_customer} = Conekta.Customers.create(customer)

      # Create subscription
      subscription = %Conekta.SubscriptionRequest{plan_id: created_plan.id}
      {:ok, created_sub} = Conekta.Subscriptions.create(created_customer.id, subscription)
      assert created_sub.status == "active"
      assert created_sub.plan_id == created_plan.id

      # Get subscription
      {:ok, fetched_sub} = Conekta.Subscriptions.get(created_customer.id)
      assert fetched_sub.id == created_sub.id

      # Pause subscription
      {:ok, paused_sub} = Conekta.Subscriptions.pause(created_customer.id)
      assert paused_sub.status == "paused"

      # Resume subscription
      {:ok, resumed_sub} = Conekta.Subscriptions.resume(created_customer.id)
      assert resumed_sub.status == "active"

      # Cancel subscription
      {:ok, canceled_sub} = Conekta.Subscriptions.cancel(created_customer.id)
      assert canceled_sub.status == "canceled"

      # Cleanup
      Conekta.Customers.delete(created_customer.id)
      Conekta.Plans.delete(created_plan.id)
    end
  end
end
