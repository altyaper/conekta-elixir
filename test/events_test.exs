defmodule ConektaTest.EventsTest do
    @moduledoc false

    use ExUnit.Case, async: false
    import Mock
    alias Conekta.Client

    describe "Events" do

        test "should list all events" do
            expected_mock = Mocks.EventsMock.get_list_mock()

            with_mock Client, [get_request: fn(_) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.EventsResponse{}) == Conekta.Events.list()
            end
        end

        test "should find an event" do
            expected_mock = Mocks.EventsMock.get_find_mock()

            with_mock Client, [get_request: fn(_) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.EventResponse{}) == Conekta.Events.find("evt_1")
            end
        end

        test "should resend an event" do
            expected_mock = Mocks.EventsMock.get_resend_mock()

            with_mock Client, [post_request: fn(_, _) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.EventResendResponse{}) == Conekta.Events.resend("evt_1", "whl_1")
            end
        end

    end
end
