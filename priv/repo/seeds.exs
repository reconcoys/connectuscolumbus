# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Connectuscolumbus.Repo.insert!(%Connectuscolumbus.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Connectuscolumbus.Repo
alias Connectuscolumbus.Accounts.Volunteer
alias Connectuscolumbus.Stories.StoryTeller
alias Connectuscolumbus.Users.User
alias FakerElixir, as: Faker

1..10
|> Enum.each(fn _ ->
  Repo.insert!(%Volunteer{
    first_name: Faker.Name.first_name(),
    last_name: Faker.Name.last_name(),
    email: Faker.Internet.email()
  })
end)

1..45
|> Enum.each(fn _ ->
  Repo.insert!(%StoryTeller{
    first_name: Faker.Name.first_name(),
    last_name: Faker.Name.last_name(),
    phone_number:
      String.replace(Faker.Phone.cell(), ["-", "(", ")", " ", "."], "") |> String.to_integer(),
    email: Faker.Internet.email(),
    comments: Faker.Lorem.sentence()
  })
end)

User.create_user(%{
  email: "test@example.com",
  password: "A1qwerty!",
  confirm_password: "A1qwerty!"
})
