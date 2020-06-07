defmodule WalkingMandarin.Repo do
  use Ecto.Repo,
    otp_app: :walking_mandarin,
    adapter: Ecto.Adapters.Postgres
end
