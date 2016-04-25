defmodule WordScram do
  use Application
  alias WordScram.Repo
  alias WordScram.Counter
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(WordScram.Endpoint, []),
      supervisor(WordScram.Repo, []),
    ]

    unless Mix.env == :test do
      children = [
        supervisor(WordScram.Endpoint, []),
        supervisor(WordScram.Repo, []),
        worker(WordScram.CounterIncrementer, []),
      ]
    end
    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WordScram.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WordScram.Endpoint.config_change(changed, removed)
    :ok
  end
end
