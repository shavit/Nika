defmodule Nika.Episode do
  use Nika.Web, :model

  schema "episodes" do
    field :name, :string
    field :author, :string
    field :explicit, :boolean, default: false
    field :description, :string
    field :picture, :string
    field :video_url, :string
    field :duration, :integer
    field :created, Ecto.Time, default: Ecto.DateTime.utc

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :author, :explicit, :description, :picture, :video_url, :duration, :created])
    |> validate_required([:name, :author, :explicit, :description, :picture, :video_url, :duration, :created])
  end
end
