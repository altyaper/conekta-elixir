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

    test "should create an order" do

        new_order = %Conekta.Order{
            currency: "MXN",
            customer_info: %{
                customer_id: "cus_2gXnQrxEpkdNfeeFT"
            },
            line_items: [%{
                name: "Testing",
                unit_price: 35000,
                quantity: 1
            }],
            charges: [%{
                payment_method: %{
                    type: "default"
                }
            }]
        }

#        Conekta.Orders.create(new_order)

    end

  end


end
