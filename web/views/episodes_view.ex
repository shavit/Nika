defmodule Nika.EpisodesView do
  use Nika.Web, :view

  def formatted_duration(duration) do
    "#{(duration |> div 60)}:#{(duration |> rem 60)}"
  end

  def formatted_uri(uri) do
    uri <> "#/"
    |> String.replace("&", "&amp;")
    |> URI.encode
  end

  def formatted_date(d) do
    # date = d |> Ecto.DateTime.to_iso8601
    day_of_week = Calendar.ISO.day_of_week(d.year, d.month, d.day)
    "#{day_in_words(day_of_week)}, "
      <>"#{zero_leading(d.day)} "
      <>"#{month_in_words(d.month)} "
      <>"#{d.year}"
      <>" 08:00:00 -0400"
  end

  defp zero_leading(n) do
    if n < 10 do
      "0#{n}"
    else
      "#{n}"
    end
  end

  defp day_in_words(n) do
    case n do
      0 -> "Sun"
      1 -> "Mon"
      2 -> "Tue"
      3 -> "Wed"
      4 -> "Thu"
      5 -> "Fri"
      6 -> "Sat"
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
