defmodule Poller.Question do
  alias __MODULE__
  alias Poller.Choice
  
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
  
  def new(%{id: id, description: description, choices: choices}) do
    new(id, description)
    |> add_choices(choices)
  end
  
  def add_choices(question, []), do: question
  
  def add_choices(question, [choice | choices]) do
    question = add_choice(question, choice)
    add_choices(question, choices)
  end
  
  def add_choice(question, %{id: id, description: description, party: party}) do
    choice = Choice.new(id, description, party)
    choices = [choice | question.choices]
    Map.put(question, :choices, choices)
  end
  
end