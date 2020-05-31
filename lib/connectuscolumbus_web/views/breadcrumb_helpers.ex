defmodule ConnectuscolumbusWeb.BreadcrumbsHelpers do
  use Phoenix.HTML
  import ConnectuscolumbusWeb.Gettext
  import ConnectuscolumbusWeb.Router.Helpers

  def breadcrumbs(args) do
    content_tag :nav, "aria-label": "breadcrumb" do
      content_tag :ol, class: "breadcrumb" do
        apply(__MODULE__, :crumbs, args)
        |> render
      end
    end
  end

  defp render([current | tail]) do
    ([render_crumb(current, :current)] ++ Enum.map(tail, &render_crumb(&1)))
    |> Enum.reverse()
  end

  defp render_crumb({text, _path}, :current) do
    content_tag(:li, class: "breadcrumb-item active") do
      text
    end
  end

  defp render_crumb({text, path}) do
    content_tag(:li, class: "breadcrumb-item") do
      link(text, to: path)
    end
  end

  def crumbs(conn, :root) do
    [{gettext("Home"), page_path(conn, :index)}]
  end

  def crumbs(conn, :tell_story) do
    [{gettext("Tell your story"), "/be-a-connectus-story-teller"} | crumbs(conn, :root)]
  end

  def crumbs(conn, :nominate) do
    [{gettext("Nominate a senior"), "/nominate-a-senior"} | crumbs(conn, :root)]
  end

  def crumbs(conn, :volunteer) do
    [{gettext("Volunteer"), "/be-a-volunteer-story-collector"} | crumbs(conn, :root)]
  end
end
