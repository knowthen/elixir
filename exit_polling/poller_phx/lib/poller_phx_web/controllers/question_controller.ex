defmodule PollerPhxWeb.QuestionController do
  use PollerPhxWeb, :controller

  alias PollerDal.Questions
  alias PollerDal.Districts

  def index(conn, %{"district_id" => district_id}) do
    district = Districts.get_district!(district_id)
    questions = Questions.list_questions_by_district_id(district_id)
    render(conn, "index.html", district: district, questions: questions)
  end
end