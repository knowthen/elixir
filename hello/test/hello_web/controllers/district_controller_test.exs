defmodule HelloWeb.DistrictControllerTest do
  use HelloWeb.ConnCase

  alias Hello.Districts

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:district) do
    {:ok, district} = Districts.create_district(@create_attrs)
    district
  end

  describe "index" do
    test "lists all districts", %{conn: conn} do
      conn = get(conn, Routes.district_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Districts"
    end
  end

  describe "new district" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.district_path(conn, :new))
      assert html_response(conn, 200) =~ "New District"
    end
  end

  describe "create district" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.district_path(conn, :create), district: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.district_path(conn, :show, id)

      conn = get(conn, Routes.district_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show District"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.district_path(conn, :create), district: @invalid_attrs)
      assert html_response(conn, 200) =~ "New District"
    end
  end

  describe "edit district" do
    setup [:create_district]

    test "renders form for editing chosen district", %{conn: conn, district: district} do
      conn = get(conn, Routes.district_path(conn, :edit, district))
      assert html_response(conn, 200) =~ "Edit District"
    end
  end

  describe "update district" do
    setup [:create_district]

    test "redirects when data is valid", %{conn: conn, district: district} do
      conn = put(conn, Routes.district_path(conn, :update, district), district: @update_attrs)
      assert redirected_to(conn) == Routes.district_path(conn, :show, district)

      conn = get(conn, Routes.district_path(conn, :show, district))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, district: district} do
      conn = put(conn, Routes.district_path(conn, :update, district), district: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit District"
    end
  end

  describe "delete district" do
    setup [:create_district]

    test "deletes chosen district", %{conn: conn, district: district} do
      conn = delete(conn, Routes.district_path(conn, :delete, district))
      assert redirected_to(conn) == Routes.district_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.district_path(conn, :show, district))
      end
    end
  end

  defp create_district(_) do
    district = fixture(:district)
    {:ok, district: district}
  end
end
