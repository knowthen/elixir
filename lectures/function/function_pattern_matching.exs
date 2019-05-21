age = IO.gets("What is your age? ")

defmodule Voter do
  # def eligibility(age) do
  #   case Integer.parse(age) do
  #     {age, _} when age < 18 -> "You can't vote yet"
  #     {age, _} when age < 25 -> "You can vote!"
  #     {_age, _} -> "You can vote and you can run for office!"
  #     :error -> "Invalid Number!"
  #   end
  # end
  # 
  def eligibility(age) when is_binary(age) do
    eligibility(Integer.parse(age))
  end

  def eligibility({age, _}) do
    eligibility(age)
  end

  def eligibility(age) when is_integer(age) and age < 18 do
    "You can't vote yet"
  end
  
  def eligibility(age) when is_integer(age) and age < 25 do
    "You can vote!"
  end
  
  def eligibility(:error) do
    "Invalid Number!"
  end
  
  def eligibility(_age) do
    "You can vote and you can run for office!"
  end
  
end

message = Voter.eligibility(age)

IO.puts(message)
