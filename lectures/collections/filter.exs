votes = [
  %{district: 1, candidate: 1, votes: 100},
  %{district: 1, candidate: 2, votes: 120},
  %{district: 1, candidate: 3, votes: 105},
  %{district: 2, candidate: 2, votes: 90},
  %{district: 2, candidate: 1, votes: 85},
  %{district: 2, candidate: 3, votes: 110},
  %{district: 3, candidate: 3, votes: 60},
  %{district: 3, candidate: 2, votes: 75},
  %{district: 3, candidate: 1, votes: 78}
]

# filtered_list = Enum.filter(votes, fn a -> a.candidate == 3 end)
filtered_list = Enum.filter(votes, &(&1.candidate == 3))

IO.inspect(filtered_list)

total_votes =
  votes
  |> Enum.filter(&(&1.candidate == 3))
  |> Enum.map(&(&1.votes))
  |> Enum.sum()
  
IO.inspect(total_votes)  
