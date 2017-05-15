defmodule ConektaTest.CustomerTest do
  use ExUnit.Case
  import Mock
  alias Conekta.CustomersResponse

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

  end

end
