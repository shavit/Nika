defmodule Nika.Episode do
  use Nika.Web, :model

  schema "episodes" do
    field :name, :string
    field :author, :string
    field :explicit, :boolean, default: false
    field :description, :string
    field :picture, :string
    field :duration, :integer
    field :created, Ecto.DateTime, default: Ecto.DateTime.utc
    field :video_url, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :author, :explicit, :description, :picture, :video_url, :duration, :created, :video_url])
    |> validate_required([:name, :author, :explicit, :description, :picture, :video_url, :duration, :created, :video_url])
  end

  def formatted_duration(struct, params \\ %{}) do
    "1234"
  end
end
