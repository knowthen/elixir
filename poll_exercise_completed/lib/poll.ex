defmodule Poll do
  defstruct candidates: []

  def new(candidates \\ []) do
    %Poll{candidates: candidates}
  end

  def start_link() do
    spawn_link(Poll, :run, [new()])
  end

  def add_candidate(pid, candidate) do
    send(pid, {:add_candidate, candidate})
  end

  def vote(pid, name) do
    send(pid, {:vote, name})
  end

  def exit(pid) do
    send(pid, :exit)
  end

  def candidates(pid) do
    send(pid, {:candidates, self()})

    receive do
      {^pid, candidates} -> candidates
    after
      5_000 -> nil
    end
  end

  def run(state) do
    receive do
      msg ->
        case handle(msg, state) do
          :exit -> :exit
          state -> run(state)
        end
    end
  end

  def handle({:add_candidate, candidate}, state) do
    candidates = [Candidate.new(candidate) | state.candidates]

    Map.put(state, :candidates, candidates)
  end

  def handle(:exit, _state), do: :exit

  def handle({:vote, name}, state) do
    candidates = Enum.map(state.candidates, &vote_for_candidate(&1, name))
    Map.put(state, :candidates, candidates)
  end

  def handle({:candidates, pid}, state) do
    send(pid, {self(), state.candidates})
    state
  end

  def vote_for_candidate(candidate = %{name: name}, update_name)
      when name == update_name do
    Map.update!(candidate, :votes, &(&1 + 1))
  end

  def vote_for_candidate(candidate, _name), do: candidate
end
