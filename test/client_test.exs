defmodule ConektaTest.ClientTest do
  use ExUnit.Case, async: false

  doctest Conekta.Client

  describe "Client" do
    test "should encode flat params" do
      customer = %Conekta.Customer{name: "Jorge"}
      assert "{\"name\":\"Jorge\"}" == Conekta.Client.encode_params(customer)
    end

    test "should encode nested params" do
      customer = %Conekta.Customer{
        name: "Jorge",
        id: nil,
        payment_sources: [
          %{
            token: "token_2039989wei9229",
            type: "default"
          }
        ]
      }

      expected =
        "{\"payment_sources\":[{\"type\":\"default\",\"token\":\"token_2039989wei9229\"}],\"name\":\"Jorge\"}"

      assert expected == Conekta.Client.encode_params(customer)
    end

    test "should encode customer struct" do
      new_order = %Conekta.Order{
        currency: "MXN",
        customer_info: %{
          customer_id: "cus_2gXnQrxEpkdNfeeFT"
        },
        shipping_lines: [
          %{
            amount: 10_000,
            carrier: "Fake Carrier"
          }
        ],
        shipping_contact: %{
          phone: "1234567890",
          address: %{
            street1: "Fake Address",
            postal_code: "00000",
            country: "Country"
          }
        },
        line_items: [
          %{
            name: "Testing",
            unit_price: 35_000,
            quantity: 1
          }
        ],
        charges: [
          %{
            amount: 45_000,
            payment_method: %{
              type: "default"
            }
          }
        ]
      }

      {:ok, expected} = Poison.encode(new_order)

      assert expected == Conekta.Client.encode_params(new_order)
    end
  end
end
