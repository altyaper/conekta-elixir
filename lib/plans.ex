defmodule Conekta.Plans do
    @moduledoc false

    alias Conekta.Handler
    alias Conekta.Client
    alias Conekta.PlansResponse

    def plans do
        Client.get_request("plans")
        |> case do
        {:ok, content} ->
            body = Handler.handle_status_code(content)
            {:ok, Poison.decode!(body, as: %PlansResponse{})}
      end
    end

end