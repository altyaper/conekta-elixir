defmodule ConektaTest.SubscriptionsTest do
    @moduledoc false

    use ExUnit.Case, async: false
    import Mock
    alias Conekta.Client

    describe "Subscriptions" do

        test "should create a subscription" do
            subscription = %Conekta.SubscriptionRequest{plan_id: "plan_1"}
            expected_mock = Mocks.SubscriptionsMock.get_create_mock()

            with_mock Client, [post_request: fn(_, _) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.SubscriptionResponse{}) == Conekta.Subscriptions.create("cus_1", subscription)
            end
        end

        test "should get a subscription" do
            expected_mock = Mocks.SubscriptionsMock.get_get_mock()

            with_mock Client, [get_request: fn(_) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.SubscriptionResponse{}) == Conekta.Subscriptions.get("cus_1")
            end
        end

        test "should update a subscription" do
            subscription = %Conekta.SubscriptionRequest{plan_id: "plan_2"}
            expected_mock = Mocks.SubscriptionsMock.get_update_mock()

            with_mock Client, [put_request: fn(_, _) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.SubscriptionResponse{}) == Conekta.Subscriptions.update("cus_1", subscription)
            end
        end

        test "should pause a subscription" do
            expected_mock = Mocks.SubscriptionsMock.get_pause_mock()

            with_mock Client, [post_request: fn(_) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.SubscriptionResponse{}) == Conekta.Subscriptions.pause("cus_1")
            end
        end

        test "should resume a subscription" do
            expected_mock = Mocks.SubscriptionsMock.get_resume_mock()

            with_mock Client, [post_request: fn(_) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.SubscriptionResponse{}) == Conekta.Subscriptions.resume("cus_1")
            end
        end

        test "should cancel a subscription" do
            expected_mock = Mocks.SubscriptionsMock.get_cancel_mock()

            with_mock Client, [post_request: fn(_) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.SubscriptionResponse{}) == Conekta.Subscriptions.cancel("cus_1")
            end
        end

    end
end
