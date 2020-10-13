defmodule Connectuscolumbus.Stories do
  @moduledoc """
  The Stories context.
  """

  import Ecto.Query, warn: false
  alias Connectuscolumbus.Repo

  alias Connectuscolumbus.Stories.StoryTeller
  alias Connectuscolumbus.Email

  @doc """
  Returns the list of story_tellers.

  ## Examples

      iex> list_story_tellers()
      [%StoryTeller{}, ...]

  """
  def list_story_tellers do
    Repo.all(StoryTeller) |> Repo.preload([:volunteer, :nominator])
  end

  @doc """
  Gets a single story_teller.

  Raises `Ecto.NoResultsError` if the Story teller does not exist.

  ## Examples

      iex> get_story_teller!(123)
      %StoryTeller{}

      iex> get_story_teller!(456)
      ** (Ecto.NoResultsError)

  """
  def get_story_teller!(id) do
    Repo.get!(StoryTeller, id) |> Repo.preload([:volunteer, :nominator])
  end

  @doc """
  Creates a story_teller.

  ## Examples

      iex> create_story_teller(%{field: value})
      {:ok, %StoryTeller{}}

      iex> create_story_teller(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_story_teller(attrs \\ %{}) do
    %StoryTeller{}
    |> Repo.preload([:volunteer, :nominator])
    |> StoryTeller.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a story_teller.

  ## Examples

      iex> update_story_teller(story_teller, %{field: new_value})
      {:ok, %StoryTeller{}}

      iex> update_story_teller(story_teller, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_story_teller(%StoryTeller{} = story_teller, attrs) do
    story_teller
    |> StoryTeller.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a story_teller.

  ## Examples

      iex> delete_story_teller(story_teller)
      {:ok, %StoryTeller{}}

      iex> delete_story_teller(story_teller)
      {:error, %Ecto.Changeset{}}

  """
  def delete_story_teller(%StoryTeller{} = story_teller) do
    Repo.delete(story_teller)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking story_teller changes.

  ## Examples

      iex> change_story_teller(story_teller)
      %Ecto.Changeset{source: %StoryTeller{}}

  """
  def change_story_teller(%StoryTeller{} = story_teller) do
    StoryTeller.changeset(story_teller, %{})
  end
end
