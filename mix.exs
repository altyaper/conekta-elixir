defmodule Conekta.Mixfile do
  use Mix.Project

  @description """
    Elixir library for Conekta api calls
  """

  def project do
    [app: :conekta,
     version: "1.0.3",
     description: @description,
     name: "Conekta",
     elixir: "~> 1.4.2",
     package: package(),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     source_url: "https://github.com/echavezNS/conekta-elixir.git"]
  end

  def application do
    [applications: [:httpoison, :logger]]
  end

  defp deps do
    [{:httpoison, "~> 0.11.1"},
      {:poison, "~> 3.0"},
      {:mock, "~> 0.2.0", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp package do
    [ maintainers: ["Jorge Chavez"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/echavezNS/conekta-elixir.git"} ]
  end

end
