# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :elixir_sso_example, ElixirSSOExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qHO65e8uQtsd20z75Prc1r/NVy/qne9W+dKFSHqk7R7RsTuNsokqHfmTkEmQp585",
  render_errors: [view: ElixirSSOExampleWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElixirSSOExample.PubSub,
  live_view: [signing_salt: "AlZf+/1q"]

config :elixir_sso_example,
  redirect_uri: "http://localhost:4000",
  domain: "YOUR_DOMAIN"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :workos,
  client_id: "project_YOUR_CLIENT_ID",
  api_key: "sk_YOUR_API_KEY"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
