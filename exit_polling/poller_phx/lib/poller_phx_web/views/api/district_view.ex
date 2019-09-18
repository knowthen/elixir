defmodule PollerPhxWeb.Api.DistrictView do
  use PollerPhxWeb, :view
  alias __MODULE__
  
  def render("index.json", %{districts: districts}) do
    render_many(districts, DistrictView, "show.json")
  end
  
  def render("show.json", %{district: district}) do
    %{id: district.id, name: district.name}
  end
end