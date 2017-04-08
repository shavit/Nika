defmodule Nika.EpisodesControllerTest do
  use Nika.ConnCase

  alias Nika.Episodes
  @valid_attrs %{author: "some content", created: %{hour: 14, min: 0, sec: 0}, description: "some content", duration: 42, explicit: true, picture: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, episodes_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing name"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, episodes_path(conn, :new)
    assert html_response(conn, 200) =~ "New episodes"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, episodes_path(conn, :create), episodes: @valid_attrs
    assert redirected_to(conn) == episodes_path(conn, :index)
    assert Repo.get_by(Episodes, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, episodes_path(conn, :create), episodes: @invalid_attrs
    assert html_response(conn, 200) =~ "New episodes"
  end

  test "shows chosen resource", %{conn: conn} do
    episodes = Repo.insert! %Episodes{}
    conn = get conn, episodes_path(conn, :show, episodes)
    assert html_response(conn, 200) =~ "Show episodes"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, episodes_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    episodes = Repo.insert! %Episodes{}
    conn = get conn, episodes_path(conn, :edit, episodes)
    assert html_response(conn, 200) =~ "Edit episodes"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    episodes = Repo.insert! %Episodes{}
    conn = put conn, episodes_path(conn, :update, episodes), episodes: @valid_attrs
    assert redirected_to(conn) == episodes_path(conn, :show, episodes)
    assert Repo.get_by(Episodes, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    episodes = Repo.insert! %Episodes{}
    conn = put conn, episodes_path(conn, :update, episodes), episodes: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit episodes"
  end

  test "deletes chosen resource", %{conn: conn} do
    episodes = Repo.insert! %Episodes{}
    conn = delete conn, episodes_path(conn, :delete, episodes)
    assert redirected_to(conn) == episodes_path(conn, :index)
    refute Repo.get(Episodes, episodes.id)
  end
end
