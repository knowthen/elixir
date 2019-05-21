age = IO.gets("What is your age? ")

defmodule Voter do
  def elgibility(age) do
    case Integer.parse(age) do
      {age, _} when age < 18 -> "You can't vote yet"
      {age, _} when age < 25 -> "You can vote!"
      {_age, _} -> "You can vote and you can run for office!"
      :error -> "Invalid Number!"
    end
  end
end

message = Voter.elgibility(age)

IO.puts(message)
