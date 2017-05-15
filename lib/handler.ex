defmodule Conekta.Handler do
  alias Conekta.ErrorHandler
  alias Conekta.CustomerResponse

  def handle_status_code(content) do
    case content.status_code do
      401 ->        
        ErrorHandler.catch_error(content)
      200 ->
        content.body
      500 ->
        ErrorHandler.raise_error(content)
    end
  end

end
