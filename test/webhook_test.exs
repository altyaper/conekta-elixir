defmodule ConektaTest.WebHookTest do
  use ExUnit.Case, async: false

  doctest Conekta.WebHook

  alias Conekta.WebHook
  alias Mocks.WebHookMock

  describe "webhook push" do
    
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

    test "should handle plan.created" do
      mock = WebHookMock.plan_created()
      {:plan_created, plan} = WebHook.received(mock)
      assert plan.id == mock["data"]["object"]["id"]
    end

    test "should handle customer.created" do
      mock = WebHookMock.customer_created()
      {:customer_created, customer} = WebHook.received(mock)
      assert customer.id == mock["data"]["object"]["id"]
    end

    test "should handle subscription.created" do
      mock = WebHookMock.subscription_created()
      {:subscription_created, subscription} = WebHook.received(mock)
      assert subscription.id == mock["data"]["object"]["id"]
    end

    test "should handle subscription.paid" do
      mock = WebHookMock.subscription_paid()
      {:subscription_paid, subscription} = WebHook.received(mock)
      assert subscription.id == mock["data"]["object"]["id"]
    end

    test "should handle subscription.canceled" do
      mock = WebHookMock.subscription_canceled()
      {:subscription_canceled, subscription} = WebHook.received(mock)
      assert subscription.id == mock["data"]["object"]["id"]
    end
    
    test "should handle charge.chargeback.created" do
      mock = WebHookMock.charge_chargeback_created()
      {:chargeback_created, chargeback} = WebHook.received(mock)
      assert chargeback.id == mock["data"]["object"]["id"]
    end
    
    test "should handle charge.chargeback.lost" do
      mock = WebHookMock.charge_chargeback_lost()
      {:chargeback_lost, chargeback} = WebHook.received(mock)
      assert chargeback.id == mock["data"]["object"]["id"]
    end

    test "should have logs" do
      mocks = [WebHookMock.charge_created(), WebHookMock.charge_paid(), WebHookMock.oxxo_charge_created(), WebHookMock.oxxo_charge_paid(), WebHookMock.spei_charge_created(), WebHookMock.spei_charge_paid(), WebHookMock.plan_created(), WebHookMock.customer_created(), WebHookMock.subscription_created(), WebHookMock.subscription_paid(), WebHookMock.subscription_canceled(), WebHookMock.charge_chargeback_created(), WebHookMock.charge_chargeback_lost()]
      Enum.map(mocks, fn mock ->
        {_, _, logs} = WebHook.received(mock, :logs)
        Enum.map(logs, fn log ->
          assert is_binary(log.id)
          assert is_binary(log.url)
          assert is_binary(log.object)
          assert is_number(log.failed_attempts)
          assert is_number(log.last_http_response_status)
          assert is_number(log.last_attempted_at)
        end)
      end)
    end
  end

end