logo_file = fn
  (:democrat) -> "donkey.png"
  (:republican) -> "elephant.png"
  (:libertarian) -> "statue.png"
  (:green) -> "flower.png"
  _ -> "missing.png"
end

file = logo_file.(:libertarian)

IO.puts(file)