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

  def encode_params(param) when is_list(param) do
    param
    |> Enum.reject(fn value ->
        case value do
          _     -> encode_params(value)
        end
       end)
    true
  end

  def struct?(param) do
    case Map.has_key?(param, :__struct__) do
      true -> Map.from_struct(param)
      false -> param
    end
  end

  def encode_params_inside(param) do
    param
    |> Enum.reject(fn{_key, value} ->
        case value do
          nil   -> true
          []    -> true
          %{}   -> true
          _     -> encode_params(value)
        end
    end)
  end

  def encode_params(param) when is_map(param) do
    param
    |> struct?
    |> Enum.reject(fn{_key, value} ->
        case value do
          nil   -> true
          []    -> true
          %{}   -> true
          _     ->
            if is_map(value) do
                if Map.has_key?(value, :__struct__) do
                    encode_params(value)
                else
                    encode_params_inside(value)
                end
            end
        end
      end)
     |> Enum.into(%{})
     |> Poison.encode
     |> ok
  end

  def encode_params(param) do
    param == nil
  end

  def ok({:ok, value}), do: value

end
