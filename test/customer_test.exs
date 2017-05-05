defmodule CustomerTest do
  use ExUnit.Case, async: false
  use HTTPoison.Base
  alias Conekta.Customer
  alias Conekta.CustomerResponse
  import Mock

  setup_all do
      System.put_env("CONEKTA_PASS", "")
      :ok
  end

  describe "Customers" do

    @tag :skip
    test "should read customers" do
      response = Conekta.Customers.customers()
      {:ok, content} = response
      assert is_list(content)
    end

    @tag :skip
    test "should create a customer" do
      new_customer = %Customer{name: "Jorge Chavez", phone: "6141234567", email: "test@conekta.com", plan_id: "plan_1", payment_sources: [%{token_id: "tok_test_visa_4242", type: "card"}], corporate: true, shipping_contacts: [], suscriptions: []}
      expected_customer_response = %CustomerResponse{id: "prueba", email: new_customer.email, name: new_customer.name, phone: new_customer.phone}
      with_mock HTTPoison, [post: fn(_, _, _, _) -> expected_customer_response end] do
        created_customer = Conekta.Customers.create_customer(new_customer)
        assert created_customer.name == expected_customer_response.name
        assert created_customer.phone == expected_customer_response.phone
      end
    end

    @tag :skip
    test "should get customer_response object" do
      expected_customer = %HTTPoison.Response{body: "{\"id\":\"cus_2gSsZT6qCTBsW4KXJ\",\"name\":\"Jorge Chavez\",\"email\":\"test@conekta.com\",\"phone\":\"6141234567\",\"livemode\":false,\"default_card_id\":null,\"cards\":[],\"subscription\":null,\"object\":\"customer\",\"created_at\":1493703790}"}
      with_mock HTTPoison, [post: fn("customers", _, _, _) -> expected_customer end] do
        new_customer = %Customer{name: "Jorge Chavez", phone: "6141234567", email: "test@conekta.com", plan_id: "plan_1", payment_sources: [%{token_id: "tok_test_visa_4242", type: "card"}], corporate: true, shipping_contacts: [], suscriptions: []}
        {:ok, customer_response} = Customers.create_customer(new_customer)
        expected_customer_response = %CustomerResponse{id: "cus_2gSsZT6qCTBsW4KXJ", name: "Jorge Chavez", livemode: false, phone: "6141234567", object: "customer", email: "test@conekta.com"}
        assert customer_response.id == expected_customer_response.id
        assert customer_response.name == expected_customer_response.name
        assert customer_response.object == expected_customer_response.object
        assert customer_response.email == expected_customer_response.email
        assert customer_response.phone == expected_customer_response.phone
      end
    end

  end

end
