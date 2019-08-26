defmodule Poller.Question do
  alias __MODULE__
  
  defstruct(
    id: nil,
    description: nil,
    choices: []
  )
  
  def new(id, description) do
    %Question{
      id: id,
      description: description
    }
  end
end