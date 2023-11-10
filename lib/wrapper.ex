defmodule Conekta.Wrapper do
    @moduledoc false
    use HTTPoison.Base
    @conekta_accept_header "application/vnd.conekta-v{{version}}+json"

    @config {__MODULE__, :config}

    def put_config(config) when is_map(config)
        and is_map_key(config, :privatekey)
        and is_map_key(config, :locale)
        and is_map_key(config, :apiversion) do
        Process.put(@config, config)
    end

    def get_config(key) do
        Process.get(@config)[key]
    end

    def process_url(url) do
        "https://api.conekta.io/" <> url
    end

    def process_request_headers(headers) do
        headers ++ headers()
    end

    def headers do
        basic_auth = "Basic " <> Base.encode64(key() <> ":")
        ["Accept": accept_header(), "Accept-Language": locale(), "Content-type": "application/json", "Authorization": basic_auth]
    end

    def accept_header do
        String.replace(@conekta_accept_header, "{{version}}", api_version())
    end

    def key do
        get_config(:privatekey) ||
        Application.get_env(:conekta, :privatekey)
    end

    def locale do
        get_config(:locale) ||
        Application.get_env(:conekta, :locale)
    end

    def api_version do
        get_config(:apiversion) ||
        Application.get_env(:conekta, :apiversion)
    end
end
