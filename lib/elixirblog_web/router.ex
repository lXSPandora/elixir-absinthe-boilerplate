defmodule ElixirblogWeb.Router do
  use ElixirblogWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElixirblogWeb do
    pipe_through :api
  end
end
