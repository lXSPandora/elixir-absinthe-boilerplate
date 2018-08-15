# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elixirblog,
  ecto_repos: [Elixirblog.Repo]

# Configures the endpoint
config :elixirblog, ElixirblogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TrxJBIpO1jzv9oZGy2yE59hSq6P8D7SctVjI8sML8dKr7M06mnz79xjH+DolujqO",
  render_errors: [view: ElixirblogWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Elixirblog.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
