tally = %{will_ferrell: 1, kristen_wiig: 2}

# candidates
# :will_ferrell, :kristen_wiig, :tina_fey

count = Map.get(tally, :will_ferrell, 0) + 1
tally = Map.put(tally, :will_ferrell, count)
IO.puts(inspect(tally))

increment = fn amt ->
  fn num -> num + amt end
end  
tally = Map.update(tally, :will_ferrell, 1, increment.(2))
IO.puts(inspect(tally))

