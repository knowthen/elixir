age = IO.gets("What is your age? ")

{age, _} = Integer.parse(age)

message = 
  if age < 18 do
    "You can't vote yet"
  else
    "You can vote!"
  end

IO.puts(message)