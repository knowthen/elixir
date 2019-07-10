defmodule Html do
  defmacro __using__(_opts) do
    quote do
      import Html
    end
  end
  
  def div(content), do: tag("div", content)

  def p(content), do: tag("p", content)

  def span(content), do: tag("span", content)
  
  defp tag(name, content) do
    "<#{name}>#{content}</#{name}>"
  end
end

defmodule Page do
  use Html
  def view(content) do
    content
    |> span()
    |> p()
    |> div()
  end
end