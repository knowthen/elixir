import Integer, only: [is_even: 1]

list1 = [1, 2, 3, 4]
list2 = [5, 6, 7, 8]

list3 =
  list1
  |> Enum.filter(&is_even/1)
  |> Enum.map(fn x ->
    list2
    |> Enum.filter(&is_even/1)
    |> Enum.map(&(&1 * x))
  end)
  |> Enum.flat_map(&(&1))
  
IO.inspect(list3, label: "from pipeline")  

list3 = for x <- list1, y <- list2, is_even(x), is_even(y), do: x * y

IO.inspect(list3, label: "from comprehension")