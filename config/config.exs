# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :walking_mandarin,
  ecto_repos: [WalkingMandarin.Repo]

# Configures the endpoint
config :walking_mandarin, WalkingMandarinWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CJaw4G2nacVhwRYkM37b/u/mA8oRofdI7ISfGKPTD6h2QhO+hRBy8/CFNUq5aKUY",
  render_errors: [view: WalkingMandarinWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: WalkingMandarin.PubSub,
  live_view: [signing_salt: "WSfhWvQm"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
