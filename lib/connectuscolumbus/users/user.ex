defmodule Connectuscolumbus.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema
  alias Connectuscolumbus.{Repo, Users.User}

  schema "users" do
    pow_user_fields()

    timestamps()
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert!()
  end
end
