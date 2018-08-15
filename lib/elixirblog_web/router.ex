defmodule ElixirblogWeb.Router do
  use ElixirblogWeb, :router

  pipeline :graphql do
    plug(:accepts, ["json"])
  end

  scope "/" do
    pipe_through(:graphql)

    forward("/graphql", Absinthe.Plug, schema: ElixirblogWeb.Schema)

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GraphiQL, schema: ElixirblogWeb.Schema)
    end
  end

end
