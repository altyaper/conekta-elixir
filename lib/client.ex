defmodule Conekta.Client do
  import Conekta.Wrapper

  def get_request(url) do
    get(url)
  end

  def post_request(url) do
    post(url, [])
  end

  def post_request(url, params) do
    post(url, encode_params(params))
  end

  def delete_request(url) do
    delete(url)
  end

  def put_request(url, params) do
    put(url, encode_params(params))
  end

  defp encode_params(param) when is_map(param) do
    param
      |> Map.from_struct
      |> Enum.reject(fn{_key, value} ->
        case value do
          nil -> true
          [] -> true
          [%{}] -> true
          _ -> false
        end
      end)
      |> Enum.into(%{})
      |> Poison.encode()
      |> ok
  end

  def ok({:ok, value}), do: value

end
