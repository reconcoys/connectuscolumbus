defmodule Connectuscolumbus.StoriesTest do
  use Connectuscolumbus.DataCase

  alias Connectuscolumbus.Stories

  describe "story_tellers" do
    alias Connectuscolumbus.Stories.StoryTeller

    @valid_attrs %{
      comments: "some comments",
      email: "some email",
      first_name: "some first_name",
      last_name: "some last_name",
      phone_number: 555_555_5555
    }
    @update_attrs %{
      comments: "some updated comments",
      email: "some updated email",
      first_name: "some updated first_name",
      last_name: "some updated last_name",
      phone_number: 555_555_5555
    }
    @invalid_attrs %{
      comments: nil,
      email: nil,
      first_name: nil,
      last_name: nil,
      phone_number: 555_555_5555
    }

    def story_teller_fixture(attrs \\ %{}) do
      {:ok, story_teller} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Stories.create_story_teller()

      story_teller
    end

    test "list_story_tellers/0 returns all story_tellers" do
      story_teller = story_teller_fixture()
      assert Stories.list_story_tellers() == [story_teller]
    end

    test "get_story_teller!/1 returns the story_teller with given id" do
      story_teller = story_teller_fixture()
      assert Stories.get_story_teller!(story_teller.id) == story_teller
    end

    test "create_story_teller/1 with valid data creates a story_teller" do
      assert {:ok, %StoryTeller{} = story_teller} = Stories.create_story_teller(@valid_attrs)
      assert story_teller.comments == "some comments"
      assert story_teller.email == "some email"
      assert story_teller.first_name == "some first_name"
      assert story_teller.last_name == "some last_name"
    end

    test "create_story_teller/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stories.create_story_teller(@invalid_attrs)
    end

    test "update_story_teller/2 with valid data updates the story_teller" do
      story_teller = story_teller_fixture()

      assert {:ok, %StoryTeller{} = story_teller} =
               Stories.update_story_teller(story_teller, @update_attrs)

      assert story_teller.comments == "some updated comments"
      assert story_teller.email == "some updated email"
      assert story_teller.first_name == "some updated first_name"
      assert story_teller.last_name == "some updated last_name"
    end

    test "update_story_teller/2 with invalid data returns error changeset" do
      story_teller = story_teller_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Stories.update_story_teller(story_teller, @invalid_attrs)

      assert story_teller == Stories.get_story_teller!(story_teller.id)
    end

    test "delete_story_teller/1 deletes the story_teller" do
      story_teller = story_teller_fixture()
      assert {:ok, %StoryTeller{}} = Stories.delete_story_teller(story_teller)
      assert_raise Ecto.NoResultsError, fn -> Stories.get_story_teller!(story_teller.id) end
    end

    test "change_story_teller/1 returns a story_teller changeset" do
      story_teller = story_teller_fixture()
      assert %Ecto.Changeset{} = Stories.change_story_teller(story_teller)
    end
  end
end
