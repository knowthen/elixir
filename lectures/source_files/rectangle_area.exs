IO.puts("Calculate area of rectangle")
length = IO.gets("What is the length? ")
width = IO.gets("What is the width? ")

{length, _} = Float.parse(length)
{width, _} = Float.parse(width)

IO.puts("The area is #{length * width}")
