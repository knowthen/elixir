defmodule Proposition do
  defstruct [:description, yes: 0, no: 0]

  def new(description) do
    %Proposition{description: description}
  end
  
  defmacro vote({:+, _, [prop, qty]}) do
    cast(prop, :yes, qty)
  end
  
  defmacro vote({:-, _, [prop, qty]}) do
    cast(prop, :no, qty)
  end
  
  defp cast(prop, vote, qty) do
    quote do
      Map.update!(unquote(prop), unquote(vote), &(&1 + unquote(qty)))
    end  
  end
  
end

