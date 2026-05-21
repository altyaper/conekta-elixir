defmodule ConektaTest.WebhooksTest do
    @moduledoc false

    use ExUnit.Case, async: false
    import Mock
    alias Conekta.Client

    describe "Webhooks" do

        test "should create a webhook" do
            webhook = %Conekta.WebhookRequest{
                url: "https://example.com/webhook",
                subscribed_events: ["charge.paid"]
            }
            expected_mock = Mocks.WebhooksMock.get_create_mock()

            with_mock Client, [post_request: fn(_, _) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.WebhookResponse{}) == Conekta.Webhooks.create(webhook)
            end
        end

        test "should list webhooks" do
            expected_mock = Mocks.WebhooksMock.get_list_mock()

            with_mock Client, [get_request: fn(_) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.WebhooksResponse{}) == Conekta.Webhooks.list()
            end
        end

        test "should find a webhook" do
            expected_mock = Mocks.WebhooksMock.get_find_mock()

            with_mock Client, [get_request: fn(_) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.WebhookResponse{}) == Conekta.Webhooks.find("wh_1")
            end
        end

        test "should update a webhook" do
            webhook = %Conekta.WebhookUpdateRequest{url: "https://new-url.com/webhook"}
            expected_mock = Mocks.WebhooksMock.get_update_mock()

            with_mock Client, [put_request: fn(_, _) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.WebhookResponse{}) == Conekta.Webhooks.update("wh_1", webhook)
            end
        end

        test "should delete a webhook" do
            expected_mock = Mocks.WebhooksMock.get_delete_mock()

            with_mock Client, [delete_request: fn(_) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.WebhookResponse{}) == Conekta.Webhooks.delete("wh_1")
            end
        end

        test "should test a webhook" do
            expected_mock = Mocks.WebhooksMock.get_test_mock()

            with_mock Client, [post_request: fn(_) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.WebhookResponse{}) == Conekta.Webhooks.test("wh_1")
            end
        end

    end
end
