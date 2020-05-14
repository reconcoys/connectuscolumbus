defmodule ConnectuscolumbusWeb.StoryTellerControllerTest do
  use ConnectuscolumbusWeb.ConnCase

  alias Connectuscolumbus.Stories
  alias Connectuscolumbus.Users.User

  @create_attrs %{
    comments: "some comments",
    email: "some email",
    first_name: "some first_name",
    last_name: "some last_name",
    phone_number: 555_555_5555
  }
  @update_attrs %{
    comments: "some updated comments",
    email: "some updated email",
    first_name: "some updated first_name",
    last_name: "some updated last_name",
    phone_number: 555_555_5555
  }
  @invalid_attrs %{
    comments: nil,
    email: nil,
    first_name: nil,
    last_name: nil,
    phone_number: 555_555_5555
  }

  def fixture(:story_teller) do
    {:ok, story_teller} = Stories.create_story_teller(@create_attrs)
    story_teller
  end

  setup %{conn: conn} do
    user = %User{email: "test@example.com"}
    conn = Pow.Plug.assign_current_user(conn, user, otp_app: :Connectuscolumbus)

    {:ok, conn: conn}
  end

  describe "index" do
    test "lists all story_tellers", %{conn: conn} do
      conn = get(conn, Routes.story_teller_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Story tellers"
    end
  end

  describe "new story_teller" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.story_teller_path(conn, :new))
      assert html_response(conn, 200) =~ "Be a ConnectUS Story Teller"
    end
  end

  describe "create story_teller" do
    test "redirects to show when data is valid", %{conn: conn} do
      create_conn =
        post(conn, Routes.story_teller_path(conn, :create), story_teller: @create_attrs)

      assert %{id: id} = redirected_params(create_conn)
      assert redirected_to(create_conn) == Routes.story_teller_path(create_conn, :show, id)

      conn = get(conn, Routes.story_teller_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Story teller"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.story_teller_path(conn, :create), story_teller: @invalid_attrs)
      assert html_response(conn, 200) =~ "Be a ConnectUS Story Teller"
    end
  end

  describe "edit story_teller" do
    setup [:create_story_teller]

    test "renders form for editing chosen story_teller", %{conn: conn, story_teller: story_teller} do
      conn = get(conn, Routes.story_teller_path(conn, :edit, story_teller))
      assert html_response(conn, 200) =~ "Edit Story teller"
    end
  end

  describe "update story_teller" do
    setup [:create_story_teller]

    test "redirects when data is valid", %{conn: conn, story_teller: story_teller} do
      update_conn =
        put(conn, Routes.story_teller_path(conn, :update, story_teller),
          story_teller: @update_attrs
        )

      assert redirected_to(update_conn) ==
               Routes.story_teller_path(update_conn, :show, story_teller)

      show_conn = get(conn, Routes.story_teller_path(conn, :show, story_teller))
      assert html_response(show_conn, 200) =~ "some updated comments"
    end

    test "renders errors when data is invalid", %{conn: conn, story_teller: story_teller} do
      conn =
        put(conn, Routes.story_teller_path(conn, :update, story_teller),
          story_teller: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Story teller"
    end
  end

  describe "delete story_teller" do
    setup [:create_story_teller]

    test "deletes chosen story_teller", %{conn: conn, story_teller: story_teller} do
      delete_conn = delete(conn, Routes.story_teller_path(conn, :delete, story_teller))
      assert redirected_to(delete_conn) == Routes.story_teller_path(delete_conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.story_teller_path(conn, :show, story_teller))
      end)
    end
  end

  defp create_story_teller(_) do
    story_teller = fixture(:story_teller)
    {:ok, story_teller: story_teller}
  end
end
