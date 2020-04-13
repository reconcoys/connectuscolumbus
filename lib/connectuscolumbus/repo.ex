defmodule Connectuscolumbus.Repo do
  use Ecto.Repo,
    otp_app: :connectuscolumbus,
    adapter: Ecto.Adapters.Postgres
end
