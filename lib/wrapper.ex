defmodule Conekta.Wrapper do
  @moduledoc false
  use HTTPoison.Base
  @conekta_accept_header "application/vnd.conekta-v{{version}}+json"

  def process_url(url) do
    "https://api.conekta.io/" <> url
  end

  def process_request_headers(headers) do
    headers ++ headers()
  end

  def headers do
    basic_auth = "Basic " <> Base.encode64(key() <> ":")

    [
      Accept: accept_header(),
      "Accept-Language": locale(),
      "Content-type": "application/json",
      Authorization: basic_auth
    ]
  end

  def accept_header do
    String.replace(@conekta_accept_header, "{{version}}", api_version())
  end

  def key do
    Application.get_env(:conekta, :private_key) || System.get_env("CONEKTA_PRIVATE_KEY")
  end

  def locale do
    Application.get_env(:conekta, :locale)
  end

  def api_version do
    Application.get_env(:conekta, :api_version)
  end
end
