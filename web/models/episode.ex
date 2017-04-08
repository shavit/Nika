defmodule Nika.Episode do
  use Nika.Web, :model

  schema "episodes" do
    field :name, :string
    field :author, :string
    field :explicit, :boolean, default: false
    field :description, :string
    field :picture, :string
    field :duration, :integer
    field :created, Ecto.Time

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:author, :explicit, :description, :picture, :duration, :created])
    |> validate_required([:author, :explicit, :description, :picture, :duration, :created])
  end
end
