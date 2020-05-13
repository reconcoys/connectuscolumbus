defmodule Connectuscolumbus.NominationsTest do
  use Connectuscolumbus.DataCase

  alias Connectuscolumbus.Nominations

  describe "nominators" do
    alias Connectuscolumbus.Nominations.Nominator

    @valid_attrs %{email: "some email", name: "some name", phone: 42}
    @update_attrs %{email: "some updated email", name: "some updated name", phone: 43}
    @invalid_attrs %{email: nil, name: nil, phone: nil}

    def nominator_fixture(attrs \\ %{}) do
      {:ok, nominator} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Nominations.create_nominator()

      nominator
    end

    test "list_nominators/0 returns all nominators" do
      nominator = nominator_fixture()
      assert Nominations.list_nominators() == [nominator]
    end

    test "get_nominator!/1 returns the nominator with given id" do
      nominator = nominator_fixture()
      assert Nominations.get_nominator!(nominator.id) == nominator
    end

    test "create_nominator/1 with valid data creates a nominator" do
      assert {:ok, %Nominator{} = nominator} = Nominations.create_nominator(@valid_attrs)
      assert nominator.email == "some email"
      assert nominator.name == "some name"
      assert nominator.phone == 42
    end

    test "create_nominator/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Nominations.create_nominator(@invalid_attrs)
    end

    test "update_nominator/2 with valid data updates the nominator" do
      nominator = nominator_fixture()
      assert {:ok, %Nominator{} = nominator} = Nominations.update_nominator(nominator, @update_attrs)
      assert nominator.email == "some updated email"
      assert nominator.name == "some updated name"
      assert nominator.phone == 43
    end

    test "update_nominator/2 with invalid data returns error changeset" do
      nominator = nominator_fixture()
      assert {:error, %Ecto.Changeset{}} = Nominations.update_nominator(nominator, @invalid_attrs)
      assert nominator == Nominations.get_nominator!(nominator.id)
    end

    test "delete_nominator/1 deletes the nominator" do
      nominator = nominator_fixture()
      assert {:ok, %Nominator{}} = Nominations.delete_nominator(nominator)
      assert_raise Ecto.NoResultsError, fn -> Nominations.get_nominator!(nominator.id) end
    end

    test "change_nominator/1 returns a nominator changeset" do
      nominator = nominator_fixture()
      assert %Ecto.Changeset{} = Nominations.change_nominator(nominator)
    end
  end
end
