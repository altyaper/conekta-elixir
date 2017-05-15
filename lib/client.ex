defmodule Conekta.Client do
  import Conekta.Wrapper
  alias Conekta.Wrapper

  def get_request(url) do
    get(url)
  end

  def post_request(url) do
    post(url, [])
  end

  def post_request(url, params) do
    post(url, encode_params(params))
  end

  defp encode_params(params) do
    #Remove null
    r = Regex.replace(~r/\"([^\"]+)\":null(,?)/,  Poison.encode!(params), "")
    #Remove []
    f = Regex.replace(~r/\"([^\"]+)\":\[\](,?)/,  r, "")
    #Remove [{}]
    Regex.replace(~r/\"([^\"]+)\":\[\{\}\](,?)/,  f, "")    
  end


end
