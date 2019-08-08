defmodule Counter do
  use GenServer
  
  def init(initial_count) do
    {:ok, initial_count}
  end
  
  def handle_call(:inc, _from, count) do
    updated_count = count + 1
    {:reply, updated_count, updated_count}
  end
  
  def handle_call(:dec, _from, count) do
    updated_count = count - 1
    {:reply, updated_count, updated_count}
  end
  
  def handle_call(:current, _from, count) do
    {:reply, count, count}
  end
  
end
