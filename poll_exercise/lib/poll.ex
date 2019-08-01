defmodule Poll do
  defstruct candidates: []

  def new(candidates \\ []) do
    %Poll{candidates: candidates}
  end

  # TODO: Implement functions neccesary to make the tests in 
  # `test/poll_test.exs` pass. More info in README.md
end
