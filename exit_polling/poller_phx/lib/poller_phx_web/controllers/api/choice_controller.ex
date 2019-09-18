defmodule PollerPhxWeb.Api.ChoiceController do
  use PollerPhxWeb, :controller

  alias PollerDal.Choices

  def index(conn, %{"question_id" => question_id}) do
    choices = Choices.list_choices_by_question_id(question_id)
    render(conn, "index.json", choices: choices)
  end
end