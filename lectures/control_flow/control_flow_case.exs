age = IO.gets("What is your age? ")

# {age, _} = Integer.parse(age)

# message = 
#   cond do
#     age < 18 -> "You can't vote yet"
#     age < 25 -> "You can vote!"
#     true -> "You can vote and you can run for office!"
#   end

message =
  case Integer.parse(age) do
    {age, _} when age < 18 -> "You can't vote yet"
    {age, _} when age < 25 -> "You can vote!"
    {_age, _} -> "You can vote and you can run for office!"
    :error -> "Invalid Number!"
  end

IO.puts(message)
