defmodule Nika.EpisodesController do
  use Nika.Web, :controller

  alias Nika.Episode

  def index(conn, _params) do
    name = Repo.all(Episodes)
    render(conn, "index.html", name: name)
  end

  def new(conn, _params) do
    changeset = Episode.changeset(%Episode{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"episodes" => episodes_params}) do
    changeset = Episode.changeset(%Episode{}, episodes_params)

    case Repo.insert(changeset) do
      {:ok, _episodes} ->
        conn
        |> put_flash(:info, "Episodes created successfully.")
        |> redirect(to: episodes_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    episodes = Repo.get!(Episodes, id)
    render(conn, "show.html", episodes: episodes)
  end

  def edit(conn, %{"id" => id}) do
    episodes = Repo.get!(Episodes, id)
    changeset = Episode.changeset(episodes)
    render(conn, "edit.html", episodes: episodes, changeset: changeset)
  end

  def update(conn, %{"id" => id, "episodes" => episodes_params}) do
    episodes = Repo.get!(Episodes, id)
    changeset = Episode.changeset(episodes, episodes_params)

    case Repo.update(changeset) do
      {:ok, episodes} ->
        conn
        |> put_flash(:info, "Episodes updated successfully.")
        |> redirect(to: episodes_path(conn, :show, episodes))
      {:error, changeset} ->
        render(conn, "edit.html", episodes: episodes, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    episodes = Repo.get!(Episodes, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(episodes)

    conn
    |> put_flash(:info, "Episodes deleted successfully.")
    |> redirect(to: episodes_path(conn, :index))
  end
end
