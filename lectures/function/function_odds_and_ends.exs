defmodule Party do
    
  @mascots %{
    democratic: "donkey",
    republican: "elephant",
    libertarian: "statue",
    green: "plant",
    constitution: "eagle",
    whig: "owl"
  }  
  
  def mascot(party) do
    @mascots[party]
  end
  
  def logo(party, size) do
    party_mascot = mascot(party)
    do_logo(party_mascot, size)  
  end
  
  defp do_logo(mascot, :small), do: "#{mascot}_small.png"
  defp do_logo(mascot, :normal), do: "#{mascot}_normal.png"
  
end