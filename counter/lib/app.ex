defmodule App do
  use Application
  
  def start(_type, _args) do
    children = [
      Cache,
      CounterSupervisor
    ]
    
    opts = [strategy: :one_for_one, name: App.Supervisor]
    Supervisor.start_link(children, opts)
  end
  
end