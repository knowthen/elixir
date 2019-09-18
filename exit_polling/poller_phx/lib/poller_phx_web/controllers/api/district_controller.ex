defmodule PollerPhxWeb.Api.DistrictController do
  use PollerPhxWeb, :controller
  
  alias PollerDal.Districts
  
  def index(conn, _params) do
    districts = Districts.list_districts()
    render(conn, "index.json", districts: districts)
  end
  
  def show(conn, %{"district_id" => district_id}) do
    district = Districts.get_district!(district_id)
    render(conn, "show.json", district: district)
  end
end