defmodule ConektaTest.CustomerTest do
  use ExUnit.Case
  import Mock
  alias Conekta.CustomersResponse
  alias Conekta.Customer

  describe "Customers" do

    test "should read customers" do

      expected_mock = Mocks.CustomersMock.get_mock()

      with_mock Conekta.Client, [get_request: fn(_) -> expected_mock end] do

        actual = Conekta.Customers.customers()
        {:ok, content} = expected_mock
        expected_customers = {:ok, Poison.decode!(content.body, as: %CustomersResponse{})}

        assert actual == expected_customers

      end
    end

    test "should create a customer" do

      expected_mock = Mocks.CustomersMock.get_new_customer_response()

      with_mock Conekta.Client, [post_request: fn(_, _) -> expected_mock end] do

          new_customer = %Customer{name: "Jorge Perez", email: "jorge@test.com"}
          {:ok, created_customer} = Conekta.Customers.create_customer(new_customer)
          assert new_customer.name == created_customer.name
          assert new_customer.email == created_customer.email

      end

    end

  end

end
