defmodule Connectuscolumbus.Stories.StoryTeller do
  use Ecto.Schema
  import Ecto.Changeset

  schema "story_tellers" do
    field(:comments, :string)
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:phone_number, :integer)

    timestamps()
  end

  @doc false
  def changeset(story_teller, attrs) do
    story_teller
    |> cast(attrs, [:email, :first_name, :last_name, :comments])
    |> validate_required([:email, :first_name, :last_name, :comments])
  end
end
