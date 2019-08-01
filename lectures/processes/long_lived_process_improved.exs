defmodule Counter do
  # Public API
  def start_link(initial_count \\ 0) when is_integer(initial_count) do
    spawn_link(Counter, :run, [initial_count])
  end
  
  def increment(pid) when is_pid(pid) do
    send(pid, :increment)
  end
  
  def decrement(pid) when is_pid(pid) do
    send(pid, :decrement)
  end
  
  def count(pid) when is_pid(pid) do
    send(pid, {:count, self()})
    
    receive do
      {^pid, count} -> count
    end
  end
  
  # Implementation Functions
  def run(count) do
    receive do
      msg ->
        handle(msg, count)
    end
    |> run()
  end
  
  def handle(:increment, count), do: count + 1
  def handle(:decrement, count), do: count - 1
  
  def handle({:count, pid}, count) do
    send(pid, {self(), count})
    count
  end
  
  def handle(msg, count) do
    IO.inspect(msg, label: "Unknown Msg")
    count
  end
  
end