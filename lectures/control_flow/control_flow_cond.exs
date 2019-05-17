age = IO.gets("What is your age? ")

{age, _} = Integer.parse(age)

message = 
  cond do
    age < 18 -> "You can't vote yet"
    age < 25 -> "You can vote!"
    true -> "You can vote and you can run for office!"
  end

IO.puts(message)
