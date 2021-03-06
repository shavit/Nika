defmodule Nika.EpisodesController do
  use Nika.Web, :controller

  alias Nika.Episode

  def index(conn, _params) do
    name = Repo.all(Episode)
    render(conn, "index.html", name: name)
  end

  def new(conn, _params) do
    changeset = Episode.changeset(%Episode{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"episode" => episode_params}) do
    changeset = Episode.changeset(%Episode{}, episode_params)

    case Repo.insert(changeset) do
      {:ok, _episodes} ->
        conn
        |> put_flash(:info, "Episode created successfully.")
        |> redirect(to: episodes_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    episode = Repo.get!(Episode, id)
    render(conn, "show.html", episode: episode)
  end

  def edit(conn, %{"id" => id}) do
    episode = Repo.get!(Episode, id)
    changeset = Episode.changeset(episode)
    render(conn, "edit.html", episode: episode, changeset: changeset)
  end

  def update(conn, %{"id" => id, "episode" => episode_params}) do
    episode = Repo.get!(Episode, id)
    changeset = Episode.changeset(Episode, episode_params)

    case Repo.update(changeset) do
      {:ok, episode} ->
        conn
        |> put_flash(:info, "Episode updated successfully.")
        |> redirect(to: episodes_path(conn, :show, episode))
      {:error, changeset} ->
        render(conn, "edit.html", episode: episode, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    episode = Repo.get!(Episode, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(episode)

    conn
    |> put_flash(:info, "Episode deleted successfully.")
    |> redirect(to: episodes_path(conn, :index))
  end

  def rss(conn, _params) do
    episodes = Repo.all(Episode)

    conn
    |> put_layout(:none)
    |> put_resp_content_type("text/xml")
    |> render "episodes.xml", episodes: episodes
  end
end
