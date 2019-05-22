defmodule Voter do
  @moduledoc """
  Functions for working with Voters.
  """
  
  @doc """
    Describes a voters eligibility based on an age

  ## Parameters
    
    - age: Integer or String that represents a persons age

  Returns `String`.

  ## Examples

      iex> Voter.eligibility(17)
      "You can't vote yet"

      iex> Voter.eligibility(18)
      "You can vote!"

      iex> Voter.eligibility(25)
      "You can vote and you can run for office!"

      iex> Voter.eligibility("17")
      "You can't vote yet"

      iex> Voter.eligibility("18")
      "You can vote!"

      iex> Voter.eligibility("25")
      "You can vote and you can run for office!"

      iex> Voter.eligibility("ten")
      "Invalid Number!"
      
  """
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
