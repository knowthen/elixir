district_candidate_votes = [
  %{district: 1, candidate: 1, votes: 1050},
  %{district: 1, candidate: 2, votes: 1200},
  %{district: 1, candidate: 3, votes: 1050},
  %{district: 2, candidate: 2, votes: 900},
  %{district: 2, candidate: 1, votes: 850},
  %{district: 2, candidate: 3, votes: 1100},
  %{district: 3, candidate: 3, votes: 1050},
  %{district: 3, candidate: 2, votes: 1750},
  %{district: 3, candidate: 1, votes: 1250}
]

candidate_totals =
  district_candidate_votes
  |> Enum.filter(&(&1.district in [1, 2]))
  |> Enum.map(&Map.take(&1, [:candidate, :votes]))
  |> Enum.group_by(&(&1.candidate), &(&1.votes))
  |> Enum.map(fn {k, v} -> {k, Enum.sum(v)} end)
  |> Enum.into(%{})
  
IO.inspect(candidate_totals)  
