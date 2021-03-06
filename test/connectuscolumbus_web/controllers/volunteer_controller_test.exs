defmodule ConnectuscolumbusWeb.VolunteerControllerTest do
  use ConnectuscolumbusWeb.ConnCase

  alias Connectuscolumbus.Accounts
  alias Connectuscolumbus.Users.User

  @create_attrs %{email: "some email", first_name: "some first_name", last_name: "some last_name"}
  @update_attrs %{
    email: "some updated email",
    first_name: "some updated first_name",
    last_name: "some updated last_name"
  }
  @invalid_attrs %{email: nil, first_name: nil, last_name: nil}

  def fixture(:volunteer) do
    {:ok, volunteer} = Accounts.create_volunteer(@create_attrs)
    volunteer
  end

  setup %{conn: conn} do
    user = %User{email: "test@example.com"}
    conn = Pow.Plug.assign_current_user(conn, user, otp_app: :Connectuscolumbus)

    {:ok, conn: conn}
  end

  describe "index" do
    test "lists all volunteers", %{conn: conn} do
      conn = get(conn, Routes.volunteer_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Volunteers"
    end
  end

  describe "new volunteer" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.volunteer_path(conn, :new))
      assert html_response(conn, 200) =~ "Be a Volunteer Story Collector"
    end
  end

  describe "create volunteer" do
    test "redirects to show when data is valid", %{conn: conn} do
      create_conn = post(conn, Routes.volunteer_path(conn, :create), volunteer: @create_attrs)

      assert %{id: id} = redirected_params(create_conn)
      assert redirected_to(create_conn) == Routes.volunteer_path(create_conn, :show, id)

      conn = get(conn, Routes.volunteer_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Volunteer"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.volunteer_path(conn, :create), volunteer: @invalid_attrs)
      assert html_response(conn, 200) =~ "Be a Volunteer Story Collector"
    end
  end

  describe "edit volunteer" do
    setup [:create_volunteer]

    test "renders form for editing chosen volunteer", %{conn: conn, volunteer: volunteer} do
      conn = get(conn, Routes.volunteer_path(conn, :edit, volunteer))
      assert html_response(conn, 200) =~ "Edit Volunteer"
    end
  end

  describe "update volunteer" do
    setup [:create_volunteer]

    test "redirects when data is valid", %{conn: conn, volunteer: volunteer} do
      updated_conn =
        put(conn, Routes.volunteer_path(conn, :update, volunteer), volunteer: @update_attrs)

      assert redirected_to(updated_conn) == Routes.volunteer_path(updated_conn, :show, volunteer)

      conn = get(conn, Routes.volunteer_path(conn, :show, volunteer))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, volunteer: volunteer} do
      conn = put(conn, Routes.volunteer_path(conn, :update, volunteer), volunteer: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Volunteer"
    end
  end

  describe "delete volunteer" do
    setup [:create_volunteer]

    test "deletes chosen volunteer", %{conn: conn, volunteer: volunteer} do
      delete_conn = delete(conn, Routes.volunteer_path(conn, :delete, volunteer))
      assert redirected_to(delete_conn) == Routes.volunteer_path(delete_conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.volunteer_path(conn, :show, volunteer))
      end)
    end
  end

  defp create_volunteer(_) do
    volunteer = fixture(:volunteer)
    {:ok, volunteer: volunteer}
  end
end
