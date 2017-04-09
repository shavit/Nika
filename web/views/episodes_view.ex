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

  def formatted_date(d) do
    # date = d |> Ecto.DateTime.to_iso8601
    day_of_week = Calendar.ISO.day_of_week(d.year, d.month, d.day)
    "#{day_in_words(day_of_week)}, "
      <>"#{d.day} "
      <>"#{month_in_words(d.month)} "
      <>"#{d.year} "
      <>" 00:00:00 -04:00"
  end

  defp day_in_words(n) do
    case n do
      1 -> "Sun"
      2 -> "Mon"
      3 -> "Tue"
      4 -> "Wed"
      5 -> "Thu"
      6 -> "Fri"
      7 -> "Sat"
    _ ->
      "Sun"
    end
  end

  defp month_in_words(n) do
    case n do
      1 -> "Jan"
      2 -> "Feb"
      3 -> "Mar"
      4 -> "Apr"
      5 -> "May"
      6 -> "Jun"
      7 -> "Jul"
      8 -> "Aug"
      9 -> "Sep"
      10 -> "Oct"
      11 -> "Nov"
      12 -> "Dec"
      _ ->
        "Jan"
    end
  end
end
