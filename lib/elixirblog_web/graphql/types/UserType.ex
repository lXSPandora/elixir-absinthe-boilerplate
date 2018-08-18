defmodule Elixirblog.UserType do
  use Absinthe.Schema.Notation

  @desc "A user of the ElixirGraphqlBoilerplate"
  object :user do
    field(:id, :id)
    field(:active, :boolean)
    field(:email, :string)
    field(:name, :string)
  end

  object :auth do
    field(:token, :string)
  end
end
