defmodule Elixirblog.Feed.Post do
  use Ecto.Schema
  import Ecto.Changeset


  schema "posts" do
    field :description, :string
    field :title, :string
    field :user, :string
    field :active, :boolean

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:user, :title, :description, :active])
    |> validate_required([:user, :title, :description, :active])
  end
end
