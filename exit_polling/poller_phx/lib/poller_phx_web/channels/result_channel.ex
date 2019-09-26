defmodule PollerPhxWeb.ResultChannel do
  use PollerPhxWeb, :channel
  require Logger
  
  def join("district:" <> district_id, _params, socket) do
    case Integer.parse(district_id) do
      {id, ""} ->
        socket = assign(socket, :district_id, id)
        pid = inspect(self())
        {:ok, %{"id" => id, "pid" => pid}, socket}
        
      _ ->
        {:error, %{reason: "Invalid District"}}
    end
  end
  
  def handle_info({:msg, msg}, socket) do
    push(socket, "msg", %{msg: msg})
    {:noreply, socket}
  end
  
  def terminate(_reason, socket) do
    district_id = socket.assigns.district_id
    Logger.info("terminating #{district_id}") 
  end
end