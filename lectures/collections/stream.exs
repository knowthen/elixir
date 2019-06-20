defmodule Composition do
  import Integer, only: [is_even: 1]

  def eager(nums) do
    nums
    |> Enum.map(&(&1 * 2))
    |> Enum.filter(&is_even/1)
    |> Enum.sum()
  end
  
  def lazy(nums) do
    nums
    |> Stream.map(&(&1 * 2))
    |> IO.inspect()
    |> Stream.filter(&is_even/1)
    |> IO.inspect()
    |> Enum.sum()
  end
  
end