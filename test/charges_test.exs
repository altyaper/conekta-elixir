defmodule ConektaTest.ChargesTest do
    @moduledoc false

    use ExUnit.Case, async: false
    import Mock
    alias Conekta.Client

    describe "Charges" do

        test "should list all charges" do
            expected_mock = Mocks.ChargesMock.get_list_mock()

            with_mock Client, [get_request: fn(_) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.ChargesResponse{}) == Conekta.Charges.list()
            end
        end

        test "should find a charge" do
            expected_mock = Mocks.ChargesMock.get_find_mock()

            with_mock Client, [get_request: fn(_) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.ChargeResponse{}) == Conekta.Charges.find("chr_1")
            end
        end

        test "should update a charge" do
            charge = %Conekta.ChargeUpdateRequest{reference_id: "ref_456"}
            expected_mock = Mocks.ChargesMock.get_update_mock()

            with_mock Client, [put_request: fn(_, _) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.ChargeResponse{}) == Conekta.Charges.update("chr_1", charge)
            end
        end

    end
end
