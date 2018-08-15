defmodule Elixirblog.Feed.Post do
  use Ecto.Schema
  import Ecto.Changeset


  schema "posts" do
    field :description, :string
    field :title, :string
    field :user, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:user, :title, :description])
    |> validate_required([:user, :title, :description])
  end
end
