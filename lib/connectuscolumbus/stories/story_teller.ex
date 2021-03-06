defmodule Connectuscolumbus.Stories.StoryTeller do
  use Ecto.Schema
  import Ecto.Changeset

  schema "story_tellers" do
    field(:comments, :string)
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:phone_number, :integer)
    field(:preferred_contact, :string)

    belongs_to(:volunteer, Connectuscolumbus.Accounts.Volunteer)
    belongs_to(:nominator, Connectuscolumbus.Nominations.Nominator)
    timestamps()
  end

  @doc false
  def changeset(story_teller, attrs) do
    inspect(attrs)

    story_teller
    |> cast(attrs, [
      :email,
      :first_name,
      :last_name,
      :comments,
      :phone_number,
      :volunteer_id,
      :nominator_id,
      :preferred_contact
    ])
    |> validate_required([:email, :first_name, :last_name, :comments, :phone_number])
  end
end
