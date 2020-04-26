defmodule Connectuscolumbus.Repo.Migrations.CreateStoryTellers do
  use Ecto.Migration

  def change do
    create table(:story_tellers) do
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :comments, :string

      timestamps()
    end

  end
end
