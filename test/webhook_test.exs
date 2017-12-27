defmodule ConektaTest.ClientTest do
  use ExUnit.Case, async: false

  doctest Conekta.WebHook

  alias Conekta.WebHook
  alias Mocks.WebHookMock

  describe "Webhook push" do
    
    test "should handle charge.created" do
      mock = WebHookMock.charge_created()
      {:charge_created, charge} = WebHook.received(mock)
      assert charge.id == mock["data"]["object"]["id"]
    end

    test "should handle charge.paid" do
      mock = WebHookMock.charge_paid()
      {:charge_paid, charge} = WebHook.received(mock)
      assert charge.id == mock["data"]["object"]["id"]
    end

    test "should handle oxxo pay charge created" do
      mock = WebHookMock.oxxo_charge_created()
      {:charge_created, charge} = WebHook.received(mock)
      assert charge.id == mock["data"]["object"]["id"]
      assert charge.payment_method.type == "oxxo"
    end

    test "should handle oxxo pay charge paid" do
      mock = WebHookMock.oxxo_charge_paid()
      {:charge_paid, charge} = WebHook.received(mock)
      assert charge.id == mock["data"]["object"]["id"]
      assert charge.payment_method.type == "oxxo"
    end

    test "should handle spei charge created" do
      mock = WebHookMock.spei_charge_created()
      {:charge_created, charge} = WebHook.received(mock)
      assert charge.id == mock["data"]["object"]["id"]
      assert charge.payment_method.object == "bank_transfer_payment"
    end

    test "should handle spei charge paid" do
      mock = WebHookMock.spei_charge_paid()
      {:charge_paid, charge} = WebHook.received(mock)
      assert charge.id == mock["data"]["object"]["id"]
      assert charge.payment_method.object == "bank_transfer_payment"
    end

    test "should handle plan.created"
    test "should handle customer.created"
    test "should handle subscription.created"
    test "should handle subscription.paid"
    test "should handle subscription.canceled"
    test "should handle charge.chargeback.created"
    test "should handle charge.chargeback.lost"
  end

end