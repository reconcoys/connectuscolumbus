defmodule ConnectuscolumbusWeb.NominatorControllerTest do
  use ConnectuscolumbusWeb.ConnCase

  alias Connectuscolumbus.Nominations
  alias Connectuscolumbus.Users.User

  @create_attrs %{email: "some email", name: "some name", phone: 42}
  @update_attrs %{email: "some updated email", name: "some updated name", phone: 43}
  @invalid_attrs %{email: nil, name: nil, phone: nil}

  def fixture(:nominator) do
    {:ok, nominator} = Nominations.create_nominator(@create_attrs)
    nominator
  end

  setup %{conn: conn} do
    user = %User{email: "test@example.com"}
    conn = Pow.Plug.assign_current_user(conn, user, otp_app: :Connectuscolumbus)

    {:ok, conn: conn}
  end

  describe "index" do
    test "lists all nominators", %{conn: conn} do
      conn = get(conn, Routes.nominator_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Nominators"
    end
  end

  describe "new nominator" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.nominator_path(conn, :new))
      assert html_response(conn, 200) =~ "New Nominator"
    end
  end

  describe "create nominator" do
    test "redirects to show when data is valid", %{conn: conn} do
      create_conn = post(conn, Routes.nominator_path(conn, :create), nominator: @create_attrs)

      assert %{id: id} = redirected_params(create_conn)
      assert redirected_to(create_conn) == Routes.nominator_path(create_conn, :show, id)

      conn = get(conn, Routes.nominator_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Nominator"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.nominator_path(conn, :create), nominator: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Nominator"
    end
  end

  describe "edit nominator" do
    setup [:create_nominator]

    test "renders form for editing chosen nominator", %{conn: conn, nominator: nominator} do
      conn = get(conn, Routes.nominator_path(conn, :edit, nominator))
      assert html_response(conn, 200) =~ "Edit Nominator"
    end
  end

  describe "update nominator" do
    setup [:create_nominator]

    test "redirects when data is valid", %{conn: conn, nominator: nominator} do
      update_conn =
        put(conn, Routes.nominator_path(conn, :update, nominator), nominator: @update_attrs)

      assert redirected_to(update_conn) == Routes.nominator_path(update_conn, :show, nominator)

      show_conn = get(conn, Routes.nominator_path(conn, :show, nominator))
      assert html_response(show_conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, nominator: nominator} do
      conn = put(conn, Routes.nominator_path(conn, :update, nominator), nominator: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Nominator"
    end
  end

  describe "delete nominator" do
    setup [:create_nominator]

    test "deletes chosen nominator", %{conn: conn, nominator: nominator} do
      delete_conn = delete(conn, Routes.nominator_path(conn, :delete, nominator))
      assert redirected_to(delete_conn) == Routes.nominator_path(delete_conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.nominator_path(conn, :show, nominator))
      end
    end
  end

  defp create_nominator(_) do
    nominator = fixture(:nominator)
    {:ok, nominator: nominator}
  end
end
