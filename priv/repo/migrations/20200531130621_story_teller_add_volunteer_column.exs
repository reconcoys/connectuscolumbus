defmodule Connectuscolumbus.Repo.Migrations.StoryTellerAddVolunteerColumn do
  use Ecto.Migration

  def change do
    alter table(:story_tellers) do
      add(:volunteer_id, references(:volunteers, on_delete: :nothing), null: true)
    end
  end
end
