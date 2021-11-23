defmodule Conekta.Client do
  @moduledoc false
  import Conekta.Wrapper

  def get_request(url) do
    get(url)
  end

  def post_request(url) do
    post(url, [])
  end

  def post_request(url, params) do
    post(url, encode_params(params), [], timeout: 150_000, recv_timeout: 150_000)
  end

  def delete_request(url) do
    delete(url)
  end

  def put_request(url, params) do
    put(url, encode_params(params))
  end

  @doc ~S"""

    ## Examples

        iex> Conekta.Client.encode_params(%Conekta.Customer{name: "Jorge Chavez", id: nil})
        "{\"name\":\"Jorge Chavez\"}"

  """
  def encode_params(param) when is_map(param) do
    param
    |> Map.from_struct()
    |> Enum.into(%{})
    |> Poison.encode()
    |> ok
  end

  def ok({:ok, value}), do: value
end
