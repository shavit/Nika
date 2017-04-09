defmodule Nika.Repo.Migrations.CreateEpisodes do
  use Ecto.Migration

  def change do
    create table(:episodes) do
      add :name, :string
      add :author, :string
      add :explicit, :boolean, default: false, null: false
      add :description, :text
      add :picture, :string
      add :video_url, :string
      add :duration, :integer
      add :created, :datetime

      timestamps()
    end

  end
end
