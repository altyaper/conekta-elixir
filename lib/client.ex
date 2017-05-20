defmodule Conekta.Client do
  import Conekta.Wrapper

  def get_request(url) do
    get(url)
  end

  def post_request(url) do
    post(url, [])
  end

  def post_request(url, params) do
    r = encode_params(params)
    IO.inspect(r)
    post(url, r)
  end

  def delete_request(url) do
    delete(url)
  end

  def put_request(url, params) do
    put(url, encode_params(params))
  end

  def struct?(param) do
    case Map.has_key?(param, :__struct__) do
      true -> Map.from_struct(param)
      false -> param
    end
  end

  def encode_params(param) when is_map(param) do
    param
    |> struct?
    |> Enum.filter(fn{_key, value} -> value end)
     |> Enum.into(%{})
     |> Poison.encode
     |> ok
  end

  def ok({:ok, value}), do: value

end
