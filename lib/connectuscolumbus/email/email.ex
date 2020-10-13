defmodule Connectuscolumbus.Email do
  import Bamboo.Email
  import Bamboo.Phoenix
  alias Connectuscolumbus.Stories.StoryTeller

  def welcome_story_teller(%StoryTeller{:nominator_id => nil} = story_teller) do
    IO.puts(story_teller.email)

    base_email()
    |> to(story_teller)
    |> subject(
      'Thank you for volunteering to tell your story with ConnectUsColumbus, Stories of strength!'
    )
    |> assign(:story_teller, story_teller)
    |> put_html_layout({Connectuscolumbus.LayoutView, 'welcome_volunteer_story_teller.html'})
  end

  def welcome_story_teller(%{:preferred_contact => 'email'} = story_teller) do
    base_email()
    |> to(story_teller.email)
    |> subject(
      'You have been nominated to tell your story with ConnectUsColumbus, Stories of strength!'
    )
    |> assign(:story_teller, story_teller)
    |> put_html_layout({Connectuscolumbus.LayoutView, 'welcome_volunteer_story_teller.html'})
  end

  defp base_email() do
    new_email()
    |> from('connectuscolumbus@gmail.com')
  end
end
