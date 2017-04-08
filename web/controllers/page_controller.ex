defmodule Nika.PageController do
  use Nika.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
