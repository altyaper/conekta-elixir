defmodule Conekta.Mixfile do
  use Mix.Project

  @description """
    Elixir library for Conekta api calls
  """

  def project do
    [
      app: :conekta,
      version: "1.2.0",
      description: @description,
      name: "Conekta",
      elixir: "~> 1.13.0",
      package: package(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: "https://github.com/Ventup-IT/conekta-elixir"
    ]
  end

  def application do
    [
      applications: [:httpoison, :logger],
      extra_applications: [:poison]
    ]
  end

  defp deps do
    [
      {:certifi, "~> 2.6.1"},
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:hackney, "~> 1.17.4"},
      {:httpoison, "~> 1.6"},
      {:poison, "~> 4.0"},
      {:mock, "~> 0.3.0", only: :test},
      {:ex_doc, "~> 0.22", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["VentUp"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/Ventup-IT/conekta-elixir.git"}
    ]
  end
end
