defmodule Conekta.Handler do
    @moduledoc false
    alias Conekta.ErrorHandler

    def handle_status_code(content) do
        case content.status_code do
            200 ->
                content.body
            500 ->
                ErrorHandler.raise_error(content)
            401 ->
                ErrorHandler.catch_error(content)
            404 ->
                ErrorHandler.catch_error(content)
            422 ->
                ErrorHandler.catch_error(content)
            _ ->
                ErrorHandler.catch_error(content)
        end
    end

end
