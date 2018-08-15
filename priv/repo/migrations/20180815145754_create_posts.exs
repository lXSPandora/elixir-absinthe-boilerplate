defmodule Elixirblog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :user, :string
      add :title, :string
      add :description, :string

      timestamps()
    end

  end
end
