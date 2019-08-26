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
  
  def add_question(poll, question) do
    questions = [question | poll.questions]

    votes = init_votes(poll.votes, question)
    
    poll
    |> Map.put(:questions, questions)
    |> Map.put(:votes, votes)
  end
  
  defp init_votes(votes, question) do
    question.choices
    |> Enum.map(fn choice -> {choice.id, 0} end)
    |> Enum.into(votes)
  end
  
  def vote(poll, choice_id) do
    do_vote(poll, choice_id, Map.has_key?(poll.votes, choice_id))
  end
  
  defp do_vote(poll, choice_id, _has_choice = true) do
    votes = Map.update!(poll.votes, choice_id, &(&1 + 1))
    Map.put(poll, :votes, votes)
  end
  
  defp do_vote(poll, _choice_id, _has_choice = false), do: poll
  
end