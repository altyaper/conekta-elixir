defmodule Conekta.ErrorHandler do
  alias Conekta.ErrorResponse

  def catch_error(content) do
    error = Poison.decode(content.body, as: %ErrorResponse{})
    raise error.details["debug_message"]
  end

  def raise_error(content) do
    error = Poison.decode!(content.body)
    raise error["error"]
  end

end
