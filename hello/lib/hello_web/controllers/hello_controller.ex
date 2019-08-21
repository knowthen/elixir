defmodule HelloWeb.HelloController do
  use HelloWeb, :controller
  
  def index(conn, %{"name" => name}) do
    render(conn, "index.html", name: name)
  end
end