defmodule Connectuscolumbus.Nominations do
  @moduledoc """
  The Nominations context.
  """

  import Ecto.Query, warn: false
  alias Connectuscolumbus.Repo

  alias Connectuscolumbus.Nominations.Nominator

  @doc """
  Returns the list of nominators.

  ## Examples

      iex> list_nominators()
      [%Nominator{}, ...]

  """
  def list_nominators do
    Repo.all(Nominator)
  end

  @doc """
  Gets a single nominator.

  Raises `Ecto.NoResultsError` if the Nominator does not exist.

  ## Examples

      iex> get_nominator!(123)
      %Nominator{}

      iex> get_nominator!(456)
      ** (Ecto.NoResultsError)

  """
  def get_nominator!(id), do: Repo.get!(Nominator, id)

  @doc """
  Creates a nominator.

  ## Examples

      iex> create_nominator(%{field: value})
      {:ok, %Nominator{}}

      iex> create_nominator(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_nominator(attrs \\ %{}) do
    %Nominator{}
    |> Nominator.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a nominator.

  ## Examples

      iex> update_nominator(nominator, %{field: new_value})
      {:ok, %Nominator{}}

      iex> update_nominator(nominator, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_nominator(%Nominator{} = nominator, attrs) do
    nominator
    |> Nominator.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a nominator.

  ## Examples

      iex> delete_nominator(nominator)
      {:ok, %Nominator{}}

      iex> delete_nominator(nominator)
      {:error, %Ecto.Changeset{}}

  """
  def delete_nominator(%Nominator{} = nominator) do
    Repo.delete(nominator)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking nominator changes.

  ## Examples

      iex> change_nominator(nominator)
      %Ecto.Changeset{source: %Nominator{}}

  """
  def change_nominator(%Nominator{} = nominator) do
    Nominator.changeset(nominator, %{})
  end
end
