defmodule ConektaTest.PlansTest do
    @moduledoc false

    use ExUnit.Case, async: false
    import Mock


    describe "Plans" do

      test "should get all plans" do

        expected_mock = Mocks.PlansMock.get_plans_mock()

        with_mock Conekta.Client, [get_request: fn(_) -> expected_mock end]do

            {:ok, content} = expected_mock
            assert Poison.decode(content.body, as: %Conekta.PlansResponse{}) == Conekta.Plans.plans()

        end

      end

    end
  
end