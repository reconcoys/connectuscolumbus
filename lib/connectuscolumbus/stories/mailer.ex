defmodule Stories.Mailer do
  use Bamboo.Mailer, otp_app: :stories

  def welcome_email(%{"nominator_id" => nil} = story_teller) do
    base_email()
    |> to(story_teller.email)
    |> subject(
      "Thank you for volunteering to tell your stroy with ConnectUsColumbus, Stories of strength!"
    )
    |> assign(:story_teller, story_teller)
    |> render("welcom_volunteer_story_teller.html")
  end
end
