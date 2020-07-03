defmodule Connectuscolumbus.Repo.Migrations.StoryTellersAddPreferredContactColumn do
  use Ecto.Migration

  def change do
    alter table("story_tellers") do
      add(:preferred_contact, :string, null: true)
    end
  end
end
