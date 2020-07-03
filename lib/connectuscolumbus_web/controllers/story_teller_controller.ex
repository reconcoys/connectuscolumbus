defmodule ConnectuscolumbusWeb.StoryTellerController do
  use ConnectuscolumbusWeb, :controller

  alias Connectuscolumbus.Stories
  alias Connectuscolumbus.Stories.StoryTeller
  alias Connectuscolumbus.Accounts
  alias Connectuscolumbus.Accounts.Volunteer

  def index(conn, _params) do
    story_tellers = Stories.list_story_tellers()
    volunteers = Accounts.list_volunteers()
    render(conn, "index.html", story_tellers: story_tellers, volunteers: volunteers)
  end

  def new(conn, _params) do
    changeset = Stories.change_story_teller(%StoryTeller{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"story_teller" => story_teller_params}) do
    case Stories.create_story_teller(story_teller_params) do
      {:ok, story_teller} ->
        conn
        |> put_flash(:info, "Story teller created successfully.")
        |> redirect(to: Routes.story_teller_path(conn, :show, story_teller))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    story_teller = Stories.get_story_teller!(id)
    render(conn, "show.html", story_teller: story_teller)
  end

  def edit(conn, %{"id" => id}) do
    story_teller = Stories.get_story_teller!(id)
    changeset = Stories.change_story_teller(story_teller)
    render(conn, "edit.html", story_teller: story_teller, changeset: changeset)
  end

  def update(conn, %{"id" => id, "story_teller" => story_teller_params}) do
    story_teller = Stories.get_story_teller!(id)

    case Stories.update_story_teller(story_teller, story_teller_params) do
      {:ok, story_teller} ->
        conn
        |> put_flash(:info, "Story teller updated successfully.")
        |> redirect(to: Routes.story_teller_path(conn, :show, story_teller))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", story_teller: story_teller, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    story_teller = Stories.get_story_teller!(id)
    {:ok, _story_teller} = Stories.delete_story_teller(story_teller)

    conn
    |> put_flash(:info, "Story teller deleted successfully.")
    |> redirect(to: Routes.story_teller_path(conn, :index))
  end

  def assign_volunteer(conn, %{"id" => id, "volunteer_id" => volunteer_id}) do
    story_teller = Stories.get_story_teller!(id)
    story_teller_params = %{volunteer_id: volunteer_id}

    case Stories.update_story_teller(
           story_teller,
           story_teller_params
         ) do
      {:ok, _story_teller} ->
        conn
        |> redirect(to: Routes.story_teller_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", story_teller: story_teller, changeset: changeset)
    end
  end
end
