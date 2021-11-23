defmodule ConektaTest.AuthRequest do
  use ExUnit.Case

  setup_all do
    Application.put_env(:conekta, :privatekey, "key_123456789012345")
  end

  describe "Auth" do
    test "should get the right headers" do
      basic_auth = "Basic " <> Base.encode64("key_123456789012345" <> ":")

      headers = [
        Accept: "application/vnd.conekta-v2.0.0+json",
        "Accept-Language": "es",
        "Content-type": "application/json",
        Authorization: basic_auth
      ]

      assert Conekta.Wrapper.headers() == headers
    end
  end
end
