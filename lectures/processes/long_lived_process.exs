defmodule Counter do
  def run(count) do
    receive do
      :increment -> count + 1
      :decrement -> count - 1
      msg ->
        IO.inspect(msg, label: "Unknown Msg")
        count
    end
    |> IO.inspect(label: "Count")
    |> run()
  end
end