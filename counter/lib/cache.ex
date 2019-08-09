defmodule Cache do
  use GenServer
  
  # Public API
  
  def start_link(_args) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end
  
  def save(key, value) do
    GenServer.cast(__MODULE__, {:save, key, value})
  end
  
  def lookup(key) do
    GenServer.call(__MODULE__, {:lookup, key})
  end
  
  # Callbacks
  
  def init(state) do
    {:ok, state}
  end
  
  def handle_cast({:save, key, value}, state) do
    new_state = Map.put(state, key, value)
    {:noreply, new_state}
  end
  
  def handle_call({:lookup, key}, _from, state) do
    reply = Map.fetch(state, key)
    {:reply, reply, state}
  end
  
end