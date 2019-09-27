defmodule Poller.PubSub do
  alias Phoenix.PubSub
  
  def district_topic(district_id), do: "district:#{district_id}"
  
  def server_name(), do: :poller
  
  def subscribe_district(district_id) do
    topic = district_topic(district_id)
    PubSub.subscribe(server_name(), topic)
  end
  
  def unsubscribe_district(district_id) do
    topic = district_topic(district_id)
    PubSub.unsubscribe(server_name(), topic)
  end
  
  def broadcast_district(district_id, choice_id, votes) do
    topic = district_topic(district_id)
    PubSub.broadcast(server_name(), topic, {:district_update, choice_id, votes})
  end
end