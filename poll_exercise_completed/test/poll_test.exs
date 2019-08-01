defmodule PollTest do
  use ExUnit.Case
  doctest Poll

  setup do
    pid = Poll.start_link()
    %{pid: pid}
  end

  test ".start_link() creates a new process", %{pid: pid} do
    assert is_pid(pid)
    assert Process.alive?(pid)
  end

  test ".add_candidate() adds a new candidate to a process", %{pid: pid} do
    Poll.add_candidate(pid, "Will")
    candidates = Poll.candidates(pid)
    candidate = Candidate.new("Will")
    assert candidates == [candidate]
  end

  test ".vote() increments a candidates vote count", %{pid: pid} do
    Poll.add_candidate(pid, "Will")
    Poll.vote(pid, "Will")
    candidates = Poll.candidates(pid)
    candidate = Candidate.new("Will", 1)
    assert candidates == [candidate]
  end

  test ".exit() kills the long running process", %{pid: pid} do
    assert Process.alive?(pid)
    Poll.exit(pid)
    :timer.sleep(100)
    refute Process.alive?(pid)
  end
end
