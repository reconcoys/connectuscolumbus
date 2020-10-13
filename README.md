# ConnectUS ColumbUS
![](https://github.com/reconcoys/connectuscolumbus/workflows/CI/badge.svg)

Install Elixir:

* `brew update`
* `brew install elixir`

Install Phoenix:

* `mix local.hex`
* `mix archive.install hex phx_new 1.4.16`


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create a docker volume for postgres with `docker volume create connectuscolumbus-postgres`
  * Create a postgres docker container with `docker container run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -v connectuscolumbus-postgres:/var/lib/postgresql/data --rm postgres:11-alpine`
  * Create your database with `mix ecto.create`
  * Run migrations with `mix ecto.migrate`
  * Seed data with `mix run priv/repo/seeds.exs`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Library Documetation:
 * Authentication: Pow: https://powauth.com/
 * Mailer: Bamboo and SendGrid: https://github.com/thoughtbot/bamboo (in local visit `http://localhost:4000/sent_emails` to see sent emails)


Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
