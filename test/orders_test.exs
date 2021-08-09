defmodule ConektaTest.OrdersTest do
  use ExUnit.Case, async: false
  import Mock

  describe "Orders" do

    test "should get orders" do

      expected_mock = Mocks.OrdersMock.get_mock()

      with_mock Conekta.Client, [get_request: fn(_) -> expected_mock end] do

        actual = Conekta.Orders.orders()
        {:ok, content} = expected_mock
        expected_orders = {:ok, Poison.decode!(content.body, as: %Conekta.OrdersResponse{})}

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
                unit_price: 35_000,
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

        with_mock Conekta.Client, [post_request: fn(_url, _params) -> expected_mock end] do

            {:ok, content} = expected_mock
            assert Poison.decode(content.body, as: %Conekta.OrdersCreateResponse{}) == Conekta.Orders.create(new_order)

        end

    end

    test "should create an order for oxxo_cash" do

        new_order = %Conekta.Order{
            currency: "MXN",
            customer_info: %{
                customer_id: "cus_2gXuVHVD7n9ewPda4"
            },
            line_items: [%{
                name: "Testing",
                unit_price: 35_000,
                quantity: 1
            }],
            charges: [%{
                payment_method: %{
                    type: "oxxo_cash",
                    expires_at: 1599661683
                }
            }]
        }

        expected_mock = Mocks.OrdersMock.get_new_order_for_oxxo_cash_response()

        with_mock Conekta.Client, [post_request: fn(_url, _params) -> expected_mock end] do

            {:ok, content} = expected_mock
            assert Poison.decode(content.body, as: %Conekta.OrdersCreateResponse{}) == Conekta.Orders.create(new_order)

        end

    end

    test "should find an order" do

       expected_mock = Mocks.OrdersMock.get_find_order_response()

       with_mock Conekta.Client, [get_request: fn(_url) -> expected_mock end] do
           {:ok, content} = expected_mock
           assert Poison.decode(content.body, as: %Conekta.OrdersFindResponse{}) == Conekta.Orders.find("ord_2gZKFPPYzE7d7Qeu9")
       end

    end


  end

  describe "Charges" do

    test "should get charges of an order" do

        expected_mock = Mocks.OrdersMock.get_charges_order_response()

        with_mock Conekta.Client, [get_request: fn(_url) -> expected_mock end] do
            {:ok, content} = expected_mock
            assert Poison.decode(content.body, as: %Conekta.OrderChargesResponse{}) == Conekta.Orders.charges("ord_2gZSnR1CU4zy3PGVz")
        end

    end

  end

end
