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
  
  def update(conn, %{"id" => id, "district" => district_params}) do
    district = Districts.get_district!(id)
    
    case Districts.update_district(district, district_params) do
      {:ok, _district} ->
        conn
        |> put_flash(:info, "District updated successfully.")
        |> redirect(to: Routes.district_path(conn, :index))
        
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", district: district, changeset: changeset)
    end
  end
  
  def edit(conn, %{"id" => id}) do
    district = Districts.get_district!(id)
    changeset = Districts.change_district(district)
    render(conn, "edit.html", district: district, changeset: changeset)
  end
  
  def delete(conn, %{"id" => id}) do
    district = Districts.get_district!(id)
    {:ok, _district} = Districts.delete_district(district)
    
    conn
    |> put_flash(:info, "District deleted successfully.")
    |> redirect(to: Routes.district_path(conn, :index))
  end
end