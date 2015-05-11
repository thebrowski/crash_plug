defmodule CrashPlug.Mixfile do
  use Mix.Project

  def project do
    [app: :crash_plug,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps,
     package: [
      contributors: ["Eddie Dombrowski"],
      licenses: ["MIT"]
     ],
     description: description
   ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "> 0.8.0"}
    ]
  end

  defp description do
    """
    Elixir plug that forces an internal server error if a certain file is present.
    Useful for testing cdn performance
    """
  end
  
end
