age = IO.gets("What is your age? ")

voter_elgibility = fn(age) -> 
  case Integer.parse(age) do
    {age, _} when age < 18 -> "You can't vote yet"
    {age, _} when age < 25 -> "You can vote!"
    {_age, _} -> "You can vote and you can run for office!"
    :error -> "Invalid Number!"
  end
end

message = voter_elgibility.(age) 

IO.puts(message)
