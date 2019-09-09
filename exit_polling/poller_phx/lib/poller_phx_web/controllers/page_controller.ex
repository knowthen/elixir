defmodule PollerPhxWeb.PageController do
  use PollerPhxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
