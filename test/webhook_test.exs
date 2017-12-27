defmodule ConektaTest.ClientTest do
  use ExUnit.Case, async: false

  #doctest Conekta.WebHook

  describe "Webhook push" do
    test "should handle charge.created"
    test "should handle charge.paid"
    test "should handle oxxo pay"
    test "should handle spei"
    test "should handle plan.created"
    test "should handle customer.created"
    test "should handle subscription.created"
    test "should handle subscription.paid"
    test "should handle subscription.canceled"
    test "should handle charge.chargeback.created"
    test "should handle charge.chargeback.lost"
  end

end