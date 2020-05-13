defmodule Connectuscolumbus.Repo.Migrations.CreateNominators do
  use Ecto.Migration

  def change do
    create table(:nominators) do
      add :name, :string
      add :email, :string
      add :phone, :integer

      timestamps()
    end

  end
end
