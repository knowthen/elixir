defmodule Candidate do
  defstruct [:name, :votes]

  def new(name, votes \\ 0) do
    %Candidate{name: name, votes: votes}
  end
end
