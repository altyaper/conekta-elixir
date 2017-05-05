defmodule Conekta.Charges do
  import Conekta.Wrapper
  alias Conekta.Charge
  alias Conekta.ChargeResponse

  def charges do
    HTTPoison.get("charges", [], [hackney: Conekta.Wrapper.auth()])
  end

  def create_charge(charge) do
    body = Poison.encode!(charge, as: Charge)
    response = HTTPoison.post("charges", body, [], [hackney: Conekta.Wrapper.auth()])
    Poison.decode!(response.body, as: %ChargeResponse{})
  end

end
