defmodule ConnectuscolumbusWeb.Router do
  use ConnectuscolumbusWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :protected do
    plug(Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
    )
  end

  scope "/" do
    pipe_through(:browser)
    pow_routes()
  end

  scope "/", ConnectuscolumbusWeb do
    pipe_through([:browser, :protected])

    get("/", PageController, :index)

    resources("/volunteers", VolunteerController)
  end

  # Other scopes may use custom stacks.
  # scope "/api", ConnectuscolumbusWeb do
  #   pipe_through :api
  # end
end
