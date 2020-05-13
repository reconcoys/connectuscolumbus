defmodule ConnectuscolumbusWeb.NominatorController do
  use ConnectuscolumbusWeb, :controller

  alias Connectuscolumbus.Nominations
  alias Connectuscolumbus.Nominations.Nominator

  def index(conn, _params) do
    nominators = Nominations.list_nominators()
    render(conn, "index.html", nominators: nominators)
  end

  def new(conn, _params) do
    changeset = Nominations.change_nominator(%Nominator{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"nominator" => nominator_params}) do
    case Nominations.create_nominator(nominator_params) do
      {:ok, nominator} ->
        conn
        |> put_flash(:info, "Nominator created successfully.")
        |> redirect(to: Routes.nominator_path(conn, :show, nominator))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    nominator = Nominations.get_nominator!(id)
    render(conn, "show.html", nominator: nominator)
  end

  def edit(conn, %{"id" => id}) do
    nominator = Nominations.get_nominator!(id)
    changeset = Nominations.change_nominator(nominator)
    render(conn, "edit.html", nominator: nominator, changeset: changeset)
  end

  def update(conn, %{"id" => id, "nominator" => nominator_params}) do
    nominator = Nominations.get_nominator!(id)

    case Nominations.update_nominator(nominator, nominator_params) do
      {:ok, nominator} ->
        conn
        |> put_flash(:info, "Nominator updated successfully.")
        |> redirect(to: Routes.nominator_path(conn, :show, nominator))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", nominator: nominator, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    nominator = Nominations.get_nominator!(id)
    {:ok, _nominator} = Nominations.delete_nominator(nominator)

    conn
    |> put_flash(:info, "Nominator deleted successfully.")
    |> redirect(to: Routes.nominator_path(conn, :index))
  end
end
