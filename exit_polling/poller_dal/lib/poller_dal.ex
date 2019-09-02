defmodule PollerDal do
  use Application

  def start(_type, _args) do
    children = [
      {PollerDal.Repo, []}
    ]

    opts = [strategy: :one_for_one, name: PollerDal.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
