defmodule Party do
    
  @mascots %{
    democratic: "donkey",
    republican: "elephant",
    libertarian: "statue",
    green: "plant",
    constitution: "eagle",
    whig: "owl"
  }  
  
  @parties Map.keys(@mascots)
  
  def mascot(party) do
    @mascots[party]
  end
  
  def logo(party, size \\ :normal)
  
  def logo(party, size) when party in @parties do
    party_mascot = mascot(party)
    do_logo(party_mascot, size)  
  end
  
  def logo(_party, size), do: do_logo("other", size)
  
  defp do_logo(mascot, :small), do: "#{mascot}_small.png"
  defp do_logo(mascot, _other_sizes), do: "#{mascot}_normal.png"
  
end
