defmodule Elixirblog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :user, :string
      add :title, :string
      add :description, :string
      add :active, :boolean, default: true

      timestamps()
    end

  end
end
