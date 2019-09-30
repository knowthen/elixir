defmodule PollerPhxWeb.ResultChannel do
  use PollerPhxWeb, :channel
  require Logger
  alias Poller.{PubSub, PollServer}
  
  def join("district:" <> district_id, _params, socket) do
    case Integer.parse(district_id) do
      {id, ""} ->
        socket = assign(socket, :district_id, id)
        PubSub.subscribe_district(id)
        poll = PollServer.get_poll(id)
        {:ok, %{"poll" => poll}, socket}
        
      _ ->
        {:error, %{reason: "Invalid District"}}
    end
  end
  
  def handle_info({:district_update, choice_id, votes}, socket) do
    push(socket, "district_update", %{choice_id: choice_id, votes: votes})
    {:noreply, socket}
  end
  
  def terminate(_reason, socket) do
    district_id = socket.assigns.district_id
    PubSub.unsubscribe_district(district_id) 
  end
end