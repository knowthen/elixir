defmodule Util do
  def sum(list), do: do_sum(list)
  defp do_sum([head | tail]), do: head + do_sum(tail)
  defp do_sum([]), do: 0
end

list = [1, 2, 3, 4, 5]

Util.sum(list) |> IO.puts()