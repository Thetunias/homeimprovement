defmodule HomeImprovement.Repo do
  use Ecto.Repo,
    otp_app: :home_improvement,
    adapter: Ecto.Adapters.Postgres
end
