defmodule Nika.EpisodesTest do
  use Nika.ModelCase

  alias Nika.Episodes

  @valid_attrs %{author: "some content", created: %{hour: 14, min: 0, sec: 0}, description: "some content", duration: 42, explicit: true, picture: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Episodes.changeset(%Episodes{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Episodes.changeset(%Episodes{}, @invalid_attrs)
    refute changeset.valid?
  end
end
