defmodule Calculate do
  def sum(data), do: Calculatetable.sum(data)
end

defprotocol Calculatetable do
  def sum(data)
end

defimpl Calculatetable, for: List do
  def sum(list), do: do_sum(list, 0)
  
  defp do_sum([], total), do: total
  defp do_sum([head | tail], total), do: do_sum(tail, head + total)
end

defimpl Calculatetable, for: Tuple do
  def sum(tuple), do: tuple |> Tuple.to_list() |> Calculatetable.sum()
end