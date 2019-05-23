defmodule Math do
  
  def add(a, b) do
    a + b
  end

  def increment(num) do
    add = fn a, b ->
      IO.puts("called anonymous fn")
      a + b
    end
    
    add.(num, 1)
  end
  
end