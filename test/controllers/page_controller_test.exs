defmodule Nika.PageControllerTest do
  use Nika.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Nika!"
  end
end
