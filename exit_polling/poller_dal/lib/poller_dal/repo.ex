defmodule PollerDal.Repo do
  use Ecto.Repo,
    otp_app: :poller_dal,
    adapter: Ecto.Adapters.Postgres
end
