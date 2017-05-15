defmodule Conekta.ErrorResponse do  
  defstruct details: [%{
    debug_message: nil,
    message: nil,
    code: nil
  }],
  object: nil,
  type: nil
end
