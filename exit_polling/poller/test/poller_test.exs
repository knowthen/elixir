defmodule PollerTest do
  use ExUnit.Case
  doctest Poller

  test "greets the world" do
    assert Poller.hello() == :world
  end
end
