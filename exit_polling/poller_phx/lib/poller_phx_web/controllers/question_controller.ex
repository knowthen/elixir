defmodule PollerPhxWeb.QuestionController do
  use PollerPhxWeb, :controller

  alias PollerDal.Questions
  alias PollerDal.Questions.Question
  alias PollerDal.Districts

  def index(conn, %{"district_id" => district_id}) do
    district = Districts.get_district!(district_id)
    questions = Questions.list_questions_by_district_id(district_id)
    render(conn, "index.html", district: district, questions: questions)
  end
    
  def new(conn, %{"district_id" => district_id}) do
    district = Districts.get_district!(district_id)
    changeset = Questions.change_question(%Question{})
    render(conn, "new.html", changeset: changeset, district: district)
  end

  def create(conn, %{"question" => question_params, "district_id" => district_id}) do
    question_params = Map.merge(question_params, %{"district_id" => district_id})

    case Questions.create_question(question_params) do
      {:ok, _question} ->
        conn
        |> put_flash(:info, "Question created successfully.")
        |> redirect(to: Routes.question_path(conn, :index, district_id))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end