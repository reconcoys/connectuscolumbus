defmodule Connectuscolumbus.Nominations.Nominator do
  use Ecto.Schema
  import Ecto.Changeset

  schema "nominators" do
    field :email, :string
    field :name, :string
    field :phone, :integer

    timestamps()
  end

  @doc false
  def changeset(nominator, attrs) do
    nominator
    |> cast(attrs, [:name, :email, :phone])
    |> validate_required([:name, :email, :phone])
  end
end
