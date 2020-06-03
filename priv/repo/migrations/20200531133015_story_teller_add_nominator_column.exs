defmodule Connectuscolumbus.Repo.Migrations.StoryTellerAddNominatorColumn do
  use Ecto.Migration

  def change do
    alter table(:story_tellers) do
      add(:nominator_id, references(:nominators, on_delete: :nothing), null: true)
    end
  end
end
