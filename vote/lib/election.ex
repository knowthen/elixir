defmodule Election do
  defstruct(
    name: "Mayor",
    candidates: [
      Candidate.new(1, "Will Ferrel"),
      Candidate.new(2, "Kristen Wiig")
    ],
    next_id: 3
  )
  
  def update(election, cmd) when is_binary(cmd) do
    update(election, String.split(cmd))
  end
  
  def update(election, ["a" <> _ | args]) do
    name = Enum.join(args, " ")
    candidate = Candidate.new(election.next_id, name)
    candidates = [candidate | election.candidates]
    %{election | candidates: candidates, next_id: election.next_id + 1}
  end
  
  def update(election, ["n" <> _ | args]) do
    name = Enum.join(args, " ")
    Map.put(election, :name, name)
  end
  
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
  
  def view_footer() do
    [
      "\n",
      "commands: (n)ame <election>, (a)dd <candidate>, (v)ote <id>, (q)uit\n"
    ]
  end
  
  def view(election) do
    [
      view_header(election),
      view_body(election),
      view_footer()
    ]
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