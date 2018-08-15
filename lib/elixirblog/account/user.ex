defmodule Elixirblog.Account.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :active, :boolean, default: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :active])
    |> validate_required([:name, :email, :password, :active])
  end
end
