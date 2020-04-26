defmodule Connectuscolumbus.Repo.Migrations.AddPhoneNumberColumnToStoryTellers do
  use Ecto.Migration

  def change do
    alter table(:story_tellers) do
      add(:phone_number, :bigint, null: false)
    end
  end
end
