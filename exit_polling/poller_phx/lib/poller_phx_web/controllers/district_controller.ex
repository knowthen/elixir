defmodule PollerPhxWeb.DistrictController do
  use PollerPhxWeb, :controller
  
  alias PollerDal.Districts
  
  def index(conn, _params) do
    districts = Districts.list_districts()
    render(conn, "index.html", districts: districts)
  end
end