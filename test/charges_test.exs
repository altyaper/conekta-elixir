defmodule ChargesTest do
  use ExUnit.Case, async: false
  alias Conekta

  setup_all do
      System.put_env("CONEKTA_PASS", "")
      :ok
  end

  describe "Charges" do

    @tag :skip
    test "should read charges" do
      response = Charges.charges()
      assert response.status_code == 200
    end
  end

end
