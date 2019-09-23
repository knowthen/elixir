defmodule PollerPhxWeb.AppController do
  use PollerPhxWeb, :controller
  
  plug :put_layout, "poll.html"
  
  def index(conn, _params) do
    render(conn)
  end
end