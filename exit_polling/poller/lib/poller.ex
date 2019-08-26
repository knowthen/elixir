defmodule Poller do
  use Application
  alias Poller.PollSupervisor
  
  def start(_type, _args) do
    children = [
      PollSupervisor
    ]
    
    opts = [strategy: :one_for_one, name: Poller.Supervisor]
    Supervisor.start_link(children, opts)
  end
  
end
