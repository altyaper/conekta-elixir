defmodule Conekta.WebHook do
  @moduledoc """
    Easy handling of Conekta WebHooks.

    Cast data into their corresponding struct.
  """

  @doc """
  Receive possible conekta params.
  [Check possible events](https://developers.conekta.com/resources/webhooks)

  **Example**:

      Conekta.WebHook.received(params)
      
      # Possible outputs:

      # => { :charge_created, %Conekta.ChargeWebHookPost{}}

      # => { :charge_paid, %Conekta.ChargeWebHookPost{}}

      # => { :plan_created, %Conekta.PlanFindResponse{}}

      # => { :customer_created, %Conekta.CustomerWebHookPost{}}

      # => { :subscription_created, %Conekta.CustomerSubscriptionResponse{}}

      # => { :subscription_paid, %Conekta.CustomerSubscriptionResponse{}}

      # => { :subscription_canceled, %Conekta.CustomerSubscriptionResponse{}}

      # => { :chargeback_created, %Conekta.ChargebackWebhookPost{}}

      # => { :chargeback_lost, %Conekta.ChargebackWebhookPost{}}
  """
  def received(params, opts \\ :none)

  def received(
        %{
          "data" => data,
          "livemode" => _livemode,
          "webhook_status" => _status,
          "id" => _id,
          "object" => _object,
          "type" => type,
          "created_at" => _created_at,
          "webhook_logs" => logs
        },
        opts
      ) do
    params = Map.new(data, &atomify/1)

    if opts == :logs do
      logs = Enum.map(logs, fn log -> Map.new(log, &atomify/1) end)
      Tuple.insert_at(cast_data(type, params), 2, cast_logs(logs))
    else
      cast_data(type, params)
    end
  end

  def received(_params, _opts), do: {:error, "Invalid params"}

  defp cast_data(type, data) do
    case type do
      "charge.created" ->
        {:charge_created, struct(Conekta.ChargeWebHookPost, data.object)}

      "charge.paid" ->
        {:charge_paid, struct(Conekta.ChargeWebHookPost, data.object)}

      "plan.create" ->
        {:plan_created, struct(Conekta.PlanFindResponse, data.object)}

      "customer.created" ->
        {:customer_created, struct(Conekta.CustomerWebHookPost, data.object)}

      "subscription.created" ->
        {:subscription_created,
         struct(Conekta.CustomerSubscriptionResponse, data.object)}

      "subscription.paid" ->
        {:subscription_paid,
         struct(Conekta.CustomerSubscriptionResponse, data.object)}

      "subscription.canceled" ->
        {:subscription_canceled,
         struct(Conekta.CustomerSubscriptionResponse, data.object)}

      "charge.chargeback.created" ->
        {:chargeback_created,
         struct(Conekta.ChargebackWebhookPost, data.object)}

      "charge.chargeback.lost" ->
        {:chargeback_lost, struct(Conekta.ChargebackWebhookPost, data.object)}

      _ ->
        {:error, "Unrecognized object type."}
    end
  end

  defp cast_logs(logs),
    do: Enum.map(logs, fn log -> struct(Conekta.WebHookLogs, log) end)

  defp atomify({k, v}) when is_binary(k) and is_map(v),
    do: {String.to_existing_atom(k), Map.new(v, &atomify/1)}

  defp atomify({k, v}) when is_binary(k) and is_list(v),
    do:
      {String.to_existing_atom(k),
       Enum.map(v, fn v -> Map.new(v, &atomify/1) end)}

  defp atomify({k, v}) when is_binary(k), do: {String.to_existing_atom(k), v}
  defp atomify({k, v}), do: {k, v}
end
