defmodule Elixirblog.UserResolvers do
  alias Elixirblog.Account

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

  def registerEmail(_parent, args, _info) do
    case Account.create_user(args) do
      {:ok, user} ->
        {:ok, user}
      _error ->
        {:error, "could not create link"}
    end
  end
end
