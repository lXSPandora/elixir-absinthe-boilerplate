defmodule Elixirblog.UserResolvers do
  alias Elixirblog.Account
  alias Elixirblog.Repo
  import Ecto.Query, warn: false

  def getUser(_parent, %{id: id}, _info) do
    case Account.get_user!(id) do
      nil ->
        {:error, "This user does not exists"}
      user ->
        {:ok, user}
    end
  end

  def getAll(_parent, _args, _info) do
    {:ok, Account.list_users()}
  end

  def me(_args, %{context: %{current_user: current_user}}) do
    {:ok, current_user}
  end

  def login(_parent, %{email: email, password: password}, _info) do
    query = from u in "users",
          where: u.email == ^email,
          select: u.password
    case Repo.one(query) do
      nil ->
        {:error, "Invalid email or password"}
      hash ->
        case Bcrypt.verify_pass(password, hash) do
          false ->
            {:error, "Invalid email or password"}
          true ->
            token = JsonWebToken.sign(%{email: email}, %{key: "gZH75aKtMN3Yj0iPS4hcgUuTwjAzZr9C"})
            {:ok, %{token: "Bearer #{token}"}}
        end
    end
  end

  def registerEmail(_parent, args, _info) do
    query = from u in "users",
          where: u.email == ^args.email,
          select: u.password
    case Repo.one(query) do
      nil ->
        case Account.create_user(args) do
          {:ok, user} ->
            {:ok, user}
          _error ->
            {:error, "Something went wrong while we create the user"}
        end
      _user ->
        {:error, "This email is already registered on the database"}
    end
  end
end
