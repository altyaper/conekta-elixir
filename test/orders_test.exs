defmodule OrdersTest do
  use ExUnit.Case, async: false
  use HTTPoison.Base
  alias Conekta.Orders
  alias Conekta.Order
  alias Conekta.Customer
  alias Conekta.Customers

  setup_all do
      System.put_env("CONEKTA_PASS", "")
      :ok
  end

  describe "Orders" do

    @tag :skip
    test "should get orders" do
      response = Orders.orders()
      {code, _} = response
      assert code == :ok
    end

    @tag :skip
    test "should create an order" do

      new_customer = %Customer{
        name: "Jorge Chavez",
        email: "test@conekta.com",
        corporate: true,
        payment_sources: [%{
            token_id: "tok_test_visa_4242",
            type: "card"
        }]
      }

      response_customer = Customers.create_customer(new_customer)
      {_, content} = response_customer

      new_order = %Order{currency: "MXN",
      customer_info: %{
          customer_id: content.id
      }, line_items: [%{
          name: "Product 1",
          unit_price: 35000,
          quantity: 1
      }], charges: [%{
          payment_method: %{
              type: "default"
          }
      }]}

      Conekta.Orders.create_order(new_order)

    end

  end


end
