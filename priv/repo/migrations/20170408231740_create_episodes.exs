defmodule Nika.Repo.Migrations.CreateEpisodes do
  use Ecto.Migration

  def change do
    create table(:episodes) do
      add :name, :string
      add :author, :string
      add :explicit, :boolean, default: false, null: false
      add :description, :string
      add :picture, :string
      add :duration, :integer
      add :created, :time

      timestamps()
    end

  end
end
