defmodule Poller.Poll do
  alias __MODULE__
  
  defstruct(
    district_id: nil,
    questions: [],
    votes: %{}
  )
  
  def new(district_id) do
    %Poll{
      district_id: district_id
    }
  end
  
end