defmodule Util do
  defmacro reverse({:+, context, [a, b]}) do
    {:-, context, [a, b]}
  end
end