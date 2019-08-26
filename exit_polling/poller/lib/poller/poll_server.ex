defmodule Poller.PollServer do
  use GenServer
  alias Poller.Poll
  
  def start_link(district_id) do
    name = district_name(district_id)
    GenServer.start_link(__MODULE__, district_id, name: name)
  end
  
  def district_name(district_id), do: :"district:#{district_id}"
  
  def add_question(district_id, question) do
    name = district_name(district_id)
    GenServer.call(name, {:add_question, question})
  end
  
  def vote(district_id, choice_id) do
    name = district_name(district_id)
    GenServer.call(name, {:add_vote, choice_id})
  end

  def get_poll(district_id) do
    name = district_name(district_id)
    GenServer.call(name, :get)
  end  
  
  # Callbacks
  
  def init(district_id) do
    poll = Poll.new(district_id)
    {:ok, poll}
  end
  
  def handle_call({:add_question, question}, _from, poll) do
    poll = Poll.add_question(poll, question)
    {:reply, poll, poll}
  end
  
  def handle_call({:add_vote, choice_id}, _from, poll) do
    poll = Poll.vote(poll, choice_id)
    {:reply, poll, poll}
  end

  def handle_call(:get, _from, poll) do
    {:reply, poll, poll}
  end
  
end