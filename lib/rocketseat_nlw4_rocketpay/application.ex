defmodule RocketseatNlw4Rocketpay.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      RocketseatNlw4Rocketpay.Repo,
      # Start the Telemetry supervisor
      RocketseatNlw4RocketpayWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: RocketseatNlw4Rocketpay.PubSub},
      # Start the Endpoint (http/https)
      RocketseatNlw4RocketpayWeb.Endpoint
      # Start a worker by calling: RocketseatNlw4Rocketpay.Worker.start_link(arg)
      # {RocketseatNlw4Rocketpay.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RocketseatNlw4Rocketpay.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RocketseatNlw4RocketpayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
