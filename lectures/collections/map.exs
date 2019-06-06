defmodule Util do
  import Enum, only: [reverse: 1]
  def map(list, fun) when is_list(list), do: do_map(list, fun)
  
  defp do_map(list, new_list \\ [], _fun)
  defp do_map([], new_list, _fun), do: reverse(new_list)
  defp do_map([head | tail], new_list, fun), do: do_map(tail, [fun.(head) | new_list], fun)
end

list = [1, 2, 3, 4, 5]

doubled = Util.map(list, fn x -> x * 2 end)
 
IO.puts(inspect(doubled))