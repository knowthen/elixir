voting_machine_ips = [
  "10.0.1.1",
  "10.0.1.2",
  "10.0.1.3",
  "10.0.1.4",
  "10.0.1.5",
  "10.0.1.6",
  "10.0.1.7",
  "10.0.1.8",
  "10.0.1.9",
  "10.0.1.10"
]

simulated_api_call = fn 
  "10.0.1.5" ->
    raise "Unable to connect"
  _ip ->
    votes = Enum.random(225..275)
    :timer.sleep(votes)
    votes
end

defmodule Worker do
  def start(fun) do
    pid = self()
    spawn_link(fn ->
      send(pid, {self(), fun.()})
    end)
  end
  
  def wait(pid) do
    receive do
      {^pid, result} -> result
    after
      2_000 -> {:error, "Receive Timeout"}  
    end
  end
end

voting_machine_ips
|> Enum.map(fn ip -> Worker.start(fn -> simulated_api_call.(ip) end) end)
|> IO.inspect()
|> Enum.map(&Worker.wait/1)
|> Enum.sum()
|> IO.inspect()

:timer.sleep(300)
Process.info(self(), :messages) |> IO.inspect()
