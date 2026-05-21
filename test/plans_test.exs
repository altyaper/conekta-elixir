defmodule ConektaTest.PlansTest do
    @moduledoc false

    use ExUnit.Case, async: false
    import Mock
    alias Conekta.Client


    describe "Plans" do

        test "should create a plan" do

            plan = %Conekta.Plan{
                name: "Monthly Plan",
                amount: 5000,
                currency: "MXN",
                interval: "month",
                frequency: 1,
                trial_period_days: 15,
                expiry_count: 12
            }

            expected_mock = Mocks.PlansMock.get_create_mock()

            with_mock Client, [post_request: fn(_, _) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.PlanCreateResponse{}) == Conekta.Plans.create(plan)
            end

        end

        test "should get all plans" do

            expected_mock = Mocks.PlansMock.get_plans_mock()

            with_mock Client, [get_request: fn(_) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.PlansResponse{}) == Conekta.Plans.plans()
            end

        end

        test "should get a plan" do

            expected_mock = Mocks.PlansMock.get_find_mock()
            with_mock Client, [get_request: fn(_) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.PlanFindResponse{}) == Conekta.Plans.find("plan_2")
            end

        end

        test "should update a plan" do

            plan = %Conekta.Plan{name: "Otro plan"}
            expected_mock = Mocks.PlansMock.get_update_mock()

            with_mock Client, [put_request: fn(_, _) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.PlanUpdateResponse{}) == Conekta.Plans.update("plan_2", plan)
            end

        end

        test "should delete a plan" do

            expected_mock = Mocks.PlansMock.get_delete_mock()

            with_mock Client, [delete_request: fn(_) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.PlanDeleteResponse{}) == Conekta.Plans.delete("plan_1")
            end

        end

    end
  
end