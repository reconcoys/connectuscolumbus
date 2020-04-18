# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :connectuscolumbus,
  ecto_repos: [Connectuscolumbus.Repo]

# Configures the endpoint
config :connectuscolumbus, ConnectuscolumbusWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rvSW1pCeS/7HH4ghWkSAYTqm8H6jgC87a69MUf/E6Ykj135FkdH8PU9Q156EDuXK",
  render_errors: [view: ConnectuscolumbusWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Connectuscolumbus.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "Tk17/xyZ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :connectuscolumbus, :pow,
  user: Connectuscolumbus.Users.User,
  repo: Connectuscolumbus.Repo

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
