defmodule Poller.PollSupervisor do
  use DynamicSupervisor
  alias Poller.PollServer
  
  def start_link(args) do
    DynamicSupervisor.start_link(__MODULE__, args, name: __MODULE__)
  end
  
  def start_poll(district_id) do
    spec = {PollServer, district_id}
    DynamicSupervisor.start_child(__MODULE__, spec)
  end
  
  # callbacks

  def init(_arg), do: DynamicSupervisor.init(strategy: :one_for_one)
end