defmodule Nika.EpisodesView do
  use Nika.Web, :view

  def formatted_duration(duration) do
    "#{(duration |> div 60)}:#{(duration |> rem 60)}"
  end

  def formatted_uri(uri) do
    uri
    |> String.replace("&", "&amp;")
    |> URI.encode
  end
end
