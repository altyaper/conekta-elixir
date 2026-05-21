defmodule ConektaTest.BalancesTest do
    @moduledoc false

    use ExUnit.Case, async: false
    import Mock
    alias Conekta.Client

    describe "Balances" do

        test "should get account balance" do
            expected_mock = Mocks.BalancesMock.get_balance_mock()

            with_mock Client, [get_request: fn(_) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.BalanceResponse{}) == Conekta.Balances.get()
            end
        end

    end
end
