defmodule Connectuscolumbus.Stories.StoryTeller do
  use Ecto.Schema
  import Ecto.Changeset

  schema "story_tellers" do
    field(:comments, :string)
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:phone_number, :integer)

    belongs_to :volunteer, Conectuscolumbus.Accounts.Volunteer
    belongs_to :nominator, Connectuscolumbus.Nominations.Nominator
    timestamps()
  end

  @doc false
  def changeset(story_teller, attrs) do
    story_teller
    |> cast(attrs, [:email, :first_name, :last_name, :comments, :phone_number])
    |> validate_required([:email, :first_name, :last_name, :comments, :phone_number])
  end
end
