defmodule Nika.Tasks.RSSGenerator do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, :ok, [name: :rss_generator])
  end

  def init(:ok) do
    {:ok, %{}}
  end
end
