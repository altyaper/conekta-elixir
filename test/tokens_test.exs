defmodule ConektaTest.TokensTest do
    @moduledoc false

    use ExUnit.Case, async: false
    import Mock
    alias Conekta.Client

    describe "Tokens" do

        test "should create a token from card details" do
            token = %Conekta.Token{
                card: %Conekta.TokenCard{
                    number: "4242424242424242",
                    name: "John Doe",
                    exp_month: "12",
                    exp_year: "25",
                    cvc: "123"
                }
            }

            expected_mock = Mocks.TokensMock.get_create_mock()

            with_mock Client, [post_request: fn(_, _) -> expected_mock end] do
                {:ok, content} = expected_mock
                assert Poison.decode(content.body, as: %Conekta.TokenResponse{}) == Conekta.Tokens.create(token)
            end
        end

    end
end
