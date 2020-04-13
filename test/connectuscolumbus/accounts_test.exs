defmodule Connectuscolumbus.AccountsTest do
  use Connectuscolumbus.DataCase

  alias Connectuscolumbus.Accounts

  describe "volunteers" do
    alias Connectuscolumbus.Accounts.Volunteer

    @valid_attrs %{email: "some email", first_name: "some first_name", last_name: "some last_name"}
    @update_attrs %{email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name"}
    @invalid_attrs %{email: nil, first_name: nil, last_name: nil}

    def volunteer_fixture(attrs \\ %{}) do
      {:ok, volunteer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_volunteer()

      volunteer
    end

    test "list_volunteers/0 returns all volunteers" do
      volunteer = volunteer_fixture()
      assert Accounts.list_volunteers() == [volunteer]
    end

    test "get_volunteer!/1 returns the volunteer with given id" do
      volunteer = volunteer_fixture()
      assert Accounts.get_volunteer!(volunteer.id) == volunteer
    end

    test "create_volunteer/1 with valid data creates a volunteer" do
      assert {:ok, %Volunteer{} = volunteer} = Accounts.create_volunteer(@valid_attrs)
      assert volunteer.email == "some email"
      assert volunteer.first_name == "some first_name"
      assert volunteer.last_name == "some last_name"
    end

    test "create_volunteer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_volunteer(@invalid_attrs)
    end

    test "update_volunteer/2 with valid data updates the volunteer" do
      volunteer = volunteer_fixture()
      assert {:ok, %Volunteer{} = volunteer} = Accounts.update_volunteer(volunteer, @update_attrs)
      assert volunteer.email == "some updated email"
      assert volunteer.first_name == "some updated first_name"
      assert volunteer.last_name == "some updated last_name"
    end

    test "update_volunteer/2 with invalid data returns error changeset" do
      volunteer = volunteer_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_volunteer(volunteer, @invalid_attrs)
      assert volunteer == Accounts.get_volunteer!(volunteer.id)
    end

    test "delete_volunteer/1 deletes the volunteer" do
      volunteer = volunteer_fixture()
      assert {:ok, %Volunteer{}} = Accounts.delete_volunteer(volunteer)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_volunteer!(volunteer.id) end
    end

    test "change_volunteer/1 returns a volunteer changeset" do
      volunteer = volunteer_fixture()
      assert %Ecto.Changeset{} = Accounts.change_volunteer(volunteer)
    end
  end
end
