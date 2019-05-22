defmodule Voter do
  @moduledoc """
  Functions for working with Voters.
  """
  
  @doc """
    Describes a voters do_eligibility based on an age

  ## Parameters
    
    - age: Integer or String that represents a persons age

  Returns `String`.

  ## Examples

      iex> Voter.do_eligibility(17)
      "You can't vote yet"

      iex> Voter.do_eligibility(18)
      "You can vote!"

      iex> Voter.do_eligibility(25)
      "You can vote and you can run for office!"

      iex> Voter.do_eligibility("17")
      "You can't vote yet"

      iex> Voter.do_eligibility("18")
      "You can vote!"

      iex> Voter.do_eligibility("25")
      "You can vote and you can run for office!"

      iex> Voter.do_eligibility("ten")
      "Invalid Number!"
      
  """
  
  def eligibility(age) when is_binary(age) or is_integer(age) do
    do_eligibility(age)
  end
  
  def eligibility(_age) do
    "Invalid input"
  end
  
  defp do_eligibility(age) when is_binary(age) do
    do_eligibility(Integer.parse(age))
  end

  defp do_eligibility({age, _}) do
    do_eligibility(age)
  end

  defp do_eligibility(age) when is_integer(age) and age < 18 do
    "You can't vote yet"
  end
  
  defp do_eligibility(age) when is_integer(age) and age < 25 do
    "You can vote!"
  end
  
  defp do_eligibility(:error) do
    "Invalid Number!"
  end
  
  defp do_eligibility(_age) do
    "You can vote and you can run for office!"
  end
  
end
