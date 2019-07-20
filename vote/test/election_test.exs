defmodule ElectionTest do
  use ExUnit.Case
  doctest Election
  
  setup do
    %{election: %Election{}}
  end
  
  test "updating election name from a command", ctx do
    command = "name Will Ferrell"
    election = Election.update(ctx.election, command)
    assert election == %Election{name: "Will Ferrell"}
  end
  
  test "adding a new candidate from a command"

  test "voting for a candidate from a command"

  test "invalid command"

  test "quitting the app"
  
end 