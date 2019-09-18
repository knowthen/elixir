defmodule PollerPhxWeb.Api.QuestionController do
  use PollerPhxWeb, :controller

  alias PollerDal.Questions

  def index(conn, %{"district_id" => district_id}) do
    questions = Questions.list_questions_by_district_id(district_id)
    render(conn, "index.json", questions: questions)
  end
end