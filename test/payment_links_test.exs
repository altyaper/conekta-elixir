defmodule ConektaTest.PaymentLinksTest do
    @moduledoc false

    use ExUnit.Case, async: false
    import Mock
    alias Conekta.Client

    describe "PaymentLinks" do

        test "should create a payment link" do
            checkout = %Conekta.Checkout{
                name: "Test Payment",
                type: "PaymentLink",
                allowed_payment_methods: ["card", "cash"],
                recurrent: false,
                order_template: %Conekta.CheckoutOrderTemplate{
                    currency: "MXN",
                    line_items: [%{name: "Product", unit_price: 10000, quantity: 1}]
                }
            }

            expected_mock = Mocks.PaymentLinksMock.get_create_mock()

            with_mock Client, [post_request: fn(_, _) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.CheckoutResponse{}) == Conekta.PaymentLinks.create(checkout)
            end
        end

        test "should list payment links" do
            expected_mock = Mocks.PaymentLinksMock.get_list_mock()

            with_mock Client, [get_request: fn(_) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.CheckoutsResponse{}) == Conekta.PaymentLinks.list()
            end
        end

        test "should find a payment link" do
            expected_mock = Mocks.PaymentLinksMock.get_find_mock()

            with_mock Client, [get_request: fn(_) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.CheckoutResponse{}) == Conekta.PaymentLinks.find("checkout_1")
            end
        end

        test "should cancel a payment link" do
            expected_mock = Mocks.PaymentLinksMock.get_cancel_mock()

            with_mock Client, [put_request: fn(_, _) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.CheckoutResponse{}) == Conekta.PaymentLinks.cancel("checkout_1")
            end
        end

        test "should send payment link via email" do
            expected_mock = Mocks.PaymentLinksMock.get_email_mock()

            with_mock Client, [post_request: fn(_, _) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.CheckoutResponse{}) == Conekta.PaymentLinks.send_email("checkout_1", "test@example.com")
            end
        end

        test "should send payment link via SMS" do
            expected_mock = Mocks.PaymentLinksMock.get_sms_mock()

            with_mock Client, [post_request: fn(_, _) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.CheckoutResponse{}) == Conekta.PaymentLinks.send_sms("checkout_1", "+521234567890")
            end
        end

    end
end
