# Connectuscolumbus

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create a docker volume for postgres with `docker volume create hello-world-postgres`
  * Create a postgres docker container with `docker container run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -v hello-world-postgres:/var/lib/postgresql/data --rm postgres:11-alpine`
  * Create your database with `mix ecto.create`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`


Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
