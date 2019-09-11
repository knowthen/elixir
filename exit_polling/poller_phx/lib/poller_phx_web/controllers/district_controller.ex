defmodule PollerPhxWeb.DistrictController do
  use PollerPhxWeb, :controller
  
  alias PollerDal.Districts
  alias PollerDal.Districts.District
  
  def index(conn, _params) do
    districts = Districts.list_districts()
    render(conn, "index.html", districts: districts)
  end
  
  def new(conn, _params) do
    changeset = Districts.change_district(%District{})
    render(conn, "new.html", changeset: changeset)
  end
  
  def create(conn, %{"district" => district_params}) do
    case Districts.create_district(district_params) do
      {:ok, _district} ->
        conn
        |> put_flash(:info, "District created successfully.")
        |> redirect(to: Routes.district_path(conn, :index))
        
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset) 
    end
  end
end