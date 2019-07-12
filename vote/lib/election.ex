defmodule Election do
  defstruct(
    name: "Mayor",
    candidates: [
      Candidate.new(1, "Will Ferrel"),
      Candidate.new(2, "Kristen Wiig")
    ],
    next_id: 3
  )
  
  def view_header(election) do
    [
      "Election for: #{election.name}\n"
    ]
  end
  
  def view_body(election) do
    election.candidates
    |> sort_candidates_by_votes_desc()
    |> candidates_to_strings()
    |> prepend_candidates_header()
  end
  
  defp prepend_candidates_header(candidates) do
    [
      "ID\tVotes\tName\n",
      "-----------------------------\n"
      | candidates
    ]
  end
  
  defp candidates_to_strings(candidates) do
    candidates
    |> Enum.map(fn %{id: id, name: name, votes: votes} ->
      "#{id}\t#{votes}\t#{name}\n"
    end) 
  end
  
  defp sort_candidates_by_votes_desc(candidates) do
    candidates
    |> Enum.sort(&(&1.votes >= &2.votes))
  end
end