defmodule Connectuscolumbus.Accounts.Volunteer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "volunteers" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(volunteer, attrs) do
    volunteer
    |> cast(attrs, [:first_name, :last_name, :email])
    |> validate_required([:first_name, :last_name, :email])
  end
end
