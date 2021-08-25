defmodule RawTerm.MixProject do
  use Mix.Project

  def project do
    [
      app: :raw_term,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      compilers: [:elixir_make | Mix.compilers()],
      make_clean: ["clean"],
      deps: deps(),
      package: package(),

      # Docs
      name: "RawTerm",
      source_url: "https://github.com/sudochop/raw_term",
      homepage_url: "https://github.com/sudochop/raw_term",
      docs: [
        main: "RawTerm",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elixir_make, "~> 0.4", runtime: false},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      files: ~w(
        src/raw_term.c
        lib
        priv/.gitkeep
        Makefile
        mix.exs
        README.md
        LICENSE
      ),
      maintainers: ["Michael Miller"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/sudochop/raw_term"},
      description: "NIF for toggling a terminal's raw mode"
    ]
  end
end
