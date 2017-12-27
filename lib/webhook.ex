defmodule Conekta.WebHook do

	def received(%{"data" => data, 
				   "livemode" => _livemode, 
				   "webhook_status" => _status, 
				   "id" => _id,
				   "object" => _object,
				   "type" => type,
				   "created_at" => _created_at,
				   "webhook_logs" => logs}) do
	  params = Map.new(data, &atomify/1)
      cast_data(type, params)
    end

	def received(_params), do: {:error, "Invalid params"}

	defp cast_data(type, data) do
		case type do
      	"charge.created" -> 
      		{:charge_created, struct(Conekta.ChargeWebHookPost, data.object)}
      	"charge.created" -> 
      	  struct(Conekta.ChargeWebHookPost, data)
      end
	end


	defp atomify({k, v}) when is_binary(k) and is_map(v),
    do: {String.to_atom(k), Map.new(v, &atomify/1)}

  defp atomify({k, v}) when is_binary(k), do: {String.to_atom(k), v}
  defp atomify({k, v}), do: {k, v}
end


# "livemode": false,
#   "webhook_status": "pending",
#   "id": "5511d4ce2412294cf6000084",
#   "object": "event",
#   "type": "charge.created",
#   "created_at": 1427231950,
#   "webhook_logs"