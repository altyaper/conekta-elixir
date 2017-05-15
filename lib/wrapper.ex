defmodule Conekta.Wrapper do
  use HTTPoison.Base
  @conekta_accept_header "application/vnd.conekta-v2.0.0+json"

  def process_url(url) do
    "https://api.conekta.io/" <> url
  end

  def process_request_headers(headers) do    
    headers ++ headers()
  end

  def headers do
    basic_auth = "Basic " <> Base.encode64(key() <> ":")
    ["Accept": @conekta_accept_header, "Content-type": "application/json", "Authorization": basic_auth]
  end

  def key do
    Application.get_env(:conekta, :privatekey)
  end

end
