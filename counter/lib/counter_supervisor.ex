defmodule CounterSupervisor do
  use Supervisor
  
  def start_link(init_args) do
    Supervisor.start_link(__MODULE__, init_args)
  end
  
  def init(init_args) do
    children = [
      Cache,
      {Counter, init_args}
    ]
    
    Supervisor.init(children, strategy: :one_for_one)
  end
  
end