use Mix.Config

config :conekta,
  locale: "es",
  public_key: System.get_env("CONEKTA_PUBLIC_KEY"),
  private_key: System.get_env("CONEKTA_PRIVATE_KEY"),
  api_version: "2.0.0"
