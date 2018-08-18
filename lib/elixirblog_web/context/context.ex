defmodule ElixirblogWeb.Context do
  @behaviour Plug

  import Plug.Conn
  import Ecto.Query, only: [where: 2]

  alias Elixirblog.Repo
  alias Elixirblog.Account.User

  def init(opts), do: opts

  def call(conn, _) do
   context = build_context(conn)
   put_private(conn, :absinthe, %{context: context})
  end

  def build_context(conn) do
   with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
   {:ok, current_user} <- authorize(token) do
     %{current_user: current_user}
   else
     _ -> %{}
   end
  end

  def authorize(token) do
    case JsonWebToken.verify(token, %{key: "gZH75aKtMN3Yj0iPS4hcgUuTwjAzZr9C"}) do
      {:ok, %{email: email}} ->
        User
          |> where(email: ^email)
          |> Repo.one
          |> case do
            nil -> {:error, "invalid authorization token"}
            user -> {:ok, user}
          end
      _error ->
        {:error, "Invalid Token"}
    end
  end
end
