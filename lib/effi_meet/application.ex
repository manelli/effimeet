defmodule EffiMeet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      EffiMeetWeb.Telemetry,
      # Start the Ecto repository
      EffiMeet.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: EffiMeet.PubSub},
      # Start Finch
      {Finch, name: EffiMeet.Finch},
      # Start the Endpoint (http/https)
      EffiMeetWeb.Endpoint
      # Start a worker by calling: EffiMeet.Worker.start_link(arg)
      # {EffiMeet.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EffiMeet.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EffiMeetWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
