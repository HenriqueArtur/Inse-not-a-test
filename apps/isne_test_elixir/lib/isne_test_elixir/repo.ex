defmodule IsneTestElixir.Repo do
  use Ecto.Repo,
    otp_app: :isne_test_elixir,
    adapter: Ecto.Adapters.Postgres
end
