defmodule Elixirblog.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:email, :string)
    field(:name, :string)
    field(:password, :string)
    field(:active, :boolean, default: true)

    timestamps()
  end

  defp encrypt_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(
          changeset,
          :password,
          Bcrypt.hash_pwd_salt(password)
        )

      _ ->
        changeset
    end
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :active])
    |> validate_required([:name, :email, :password, :active])
    |> encrypt_password()
  end
end
