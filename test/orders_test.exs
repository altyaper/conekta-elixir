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
                customer_id: "cus_2gXuVHVD7n9ewPda4"
            },
            line_items: [%{
                name: "Testing",
                unit_price: 35000,
                quantity: 1
            }],
            charges: [%{
                payment_method: %{
                    type: "card",
                    token_id: "tok_test_visa_4242"
                }
            }]
        }

        expected_mock = Mocks.OrdersMock.get_new_order_response()

        with_mock Conekta.Client, [post_request: fn(_url,_params) -> expected_mock end] do

            {:ok, content} = expected_mock
            assert Poison.decode(content.body, as: %Conekta.OrdersCreateResponse{}) == Conekta.Orders.create(new_order)

        end

    end

    @tag :skip
    test "should update an order" do

      updated_order = %Conekta.Order{currency: "USD"}

#      Conekta.Orders.update("ord_2gYz1hrCV5Zk7iBDk", updated_order)

    end

  end


end
