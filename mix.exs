defmodule YAMFhash.MixProject do
  use Mix.Project

  def project do
    [
      app: :yamfhash,
      version: "0.1.0",
      name: "YAMFhash",
      source_url: "https://github.com/mwmiller/yamfhash",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:blake2, ">= 1.0.0"},
      {:equivalex, "~> 1.0"},
      {:stlv, ">= 0.0.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    YAMFhash - a pure Elixir YAMF-Hash implementation
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Matt Miller"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/mwmiller/yamfhash",
        "Description" => "https://github.com/AljoschaMeyer/yamf-hash"
      }
    ]
  end
end
