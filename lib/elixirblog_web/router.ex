defmodule ElixirblogWeb.Router do
  use Phoenix.Router

  pipeline :graphql do
    plug ElixirblogWeb.Context
  end

  scope "/graphql" do
    pipe_through :graphql

    forward "/", Absinthe.Plug,
      schema: ElixirblogWeb.Schema
  end
end
