defmodule PollerPhxWeb.Api.ChoiceController do
  use PollerPhxWeb, :controller

  alias PollerDal.Choices
  alias Poller.{PollServer, PollSupervisor}

  def index(conn, %{"question_id" => question_id}) do
    choices = Choices.list_choices_by_question_id(question_id)
    render(conn, "index.json", choices: choices)
  end
  
  def vote(conn, %{"district_id" => district_id, "choice_id" => choice_id}) do
    district_id = String.to_integer(district_id)
    choice_id = String.to_integer(choice_id)
    start_poll(district_id)
    PollServer.vote(district_id, choice_id)
    send_resp(conn, 204, "")
  end 
  
  defp start_poll(district_id) do
    district_name = PollServer.district_name(district_id)
    
    case Process.whereis(district_name) do
      nil -> PollSupervisor.start_poll(district_id)
      pid -> pid
    end
  end
end