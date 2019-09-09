# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :poller_phx, PollerPhxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KfFaDB8oUYiuZ1fujZjPTGuV7SL/2rMFzquKoAnc1OTVHWZ5xoYKZ2mYJuA+RvGS",
  render_errors: [view: PollerPhxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PollerPhx.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
