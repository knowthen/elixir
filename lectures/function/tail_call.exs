defmodule Util do
  def sum(list), do: do_sum(list, 0)
  defp do_sum([head | tail], total) do 
    Process.info(self(), :stack_size)
    |> IO.inspect()
    do_sum(tail, total + head)
  end
  defp do_sum([], total), do: total
end

# list = [1, 2, 3, 4, 5]
# 
# Util.sum(list) |> IO.puts()
