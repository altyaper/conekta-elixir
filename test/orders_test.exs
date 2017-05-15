defmodule ConektaTest.OrdersTest do
  use ExUnit.Case, async: false
  import Mock
  alias Conekta.OrdersResponse

  describe "Orders" do

    test "should get orders" do

      expected_mock = Mocks.OrdersMock.get_mock()

      with_mock Conekta.Client, [get_request: fn(_) -> expected_mock end] do

        actual = Conekta.Orders.orders()
        {:ok, content} = expected_mock
        expected_orders = {:ok, Poison.decode!(content.body, as: %OrdersResponse{})}

        assert actual == expected_orders

      end

    end

  end


end
