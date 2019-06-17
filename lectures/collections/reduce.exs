list = [1, 2, 3, 4]

# sum = Enum.reduce(list, fn n, acc -> n + acc end)
# sum = Enum.reduce(list, &(&1 + &2))
# sum = Enum.reduce(list, 100, &+/2)
sum = Enum.sum(list)

IO.puts(sum)
