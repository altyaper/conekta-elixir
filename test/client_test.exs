defmodule ConektaTest.ClientTest do
    use ExUnit.Case, async: false

   describe "Client" do

    test "should encode flat params" do
        customer = %Conekta.Customer{name: "Jorge", id: nil}
        assert "{\"name\":\"Jorge\"}" == Conekta.Client.encode_params(customer)
    end

    test "should encode nested params" do

        customer = %Conekta.Customer{name: "Jorge", id: nil, payment_sources: [%{
            token: "token_2039989wei9229",
            type: "default"
        }], shipping_contacts: []}

        expected = "{\"payment_sources\":[{\"type\":\"default\",\"token\":\"token_2039989wei9229\"}],\"name\":\"Jorge\"}"
        assert expected == Conekta.Client.encode_params(customer)
    end

   end

end