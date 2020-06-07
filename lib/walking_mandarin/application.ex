defmodule WalkingMandarin.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      WalkingMandarin.Repo,
      # Start the Telemetry supervisor
      WalkingMandarinWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: WalkingMandarin.PubSub},
      # Start the Endpoint (http/https)
      WalkingMandarinWeb.Endpoint
      # Start a worker by calling: WalkingMandarin.Worker.start_link(arg)
      # {WalkingMandarin.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WalkingMandarin.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WalkingMandarinWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
