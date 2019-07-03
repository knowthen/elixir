defmodule Util do
  defmacro reverse({:+, context, [a, b]}) do
    # {:-, context, [a, b]}
    quote do
      unquote(a) - unquote(b)
    end
  end
end
