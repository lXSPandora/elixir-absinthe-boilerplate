defmodule ElixirblogWeb.Schema do
  use Absinthe.Schema

  alias Elixirblog.UserResolvers

  import_types(Elixirblog.UserType)

  query do
    @desc "Gets the logged user"
    field :me, :user do
      resolve(&UserResolvers.me/2)
    end

    @desc "Gets one user"
    field :user, :user do
      arg(:id, non_null(:id))
      resolve(&UserResolvers.getUser/3)
    end

    @desc "Gets a bunch of users"
    field :users, list_of(:user) do
      resolve(&UserResolvers.getAll/3)
    end
  end

  mutation do
    @desc "Logs in the user"
    field :login, :auth do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&UserResolvers.login/3)
    end

    @desc "Insert user"
    field :register, :auth do
      arg(:email, non_null(:string))
      arg(:name, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&UserResolvers.registerEmail/3)
    end
  end
end
