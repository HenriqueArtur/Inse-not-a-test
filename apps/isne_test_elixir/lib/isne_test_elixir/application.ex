defmodule IsneTestElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      IsneTestElixir.Repo,
      {DNSCluster, query: Application.get_env(:isne_test_elixir, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: IsneTestElixir.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: IsneTestElixir.Finch}
      # Start a worker by calling: IsneTestElixir.Worker.start_link(arg)
      # {IsneTestElixir.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: IsneTestElixir.Supervisor)
  end
end
