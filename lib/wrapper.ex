defmodule Conekta.Wrapper do
  use HTTPoison.Base
  @conekta_accept_header "application/vnd.conekta-v0.3.0+json"

  def process_url(url) do
    "https://api.conekta.io/" <> url
  end

  defp process_request_headers(headers) do
    headers ++ ["Accept": @conekta_accept_header, "Content-type": "application/json" ]
  end

  defp key do
    Application.get_env(:conekta, :privatekey)
  end

  defp pass do
    System.get_env("CONEKTA_PASS")
  end

  def auth do
    [basic_auth: {key(), pass()}]
  end

end
