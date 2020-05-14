defmodule ConnectuscolumbusWeb.PageControllerTest do
  use ConnectuscolumbusWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Everyone has a story"
  end
end
