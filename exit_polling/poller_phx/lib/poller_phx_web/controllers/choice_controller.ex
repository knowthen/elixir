defmodule PollerPhxWeb.ChoiceController do
  use PollerPhxWeb, :controller

  alias PollerDal.Choices
  alias PollerDal.Choices.Choice
  alias PollerDal.Questions
  alias PollerDal.Districts

  def index(conn, %{"district_id" => district_id, "question_id" => question_id}) do
    choices = Choices.list_choices_by_question_id(question_id)
    district = Districts.get_district!(district_id)
    question = Questions.get_question!(question_id)

    render(conn, "index.html",
      choices: choices,
      district: district,
      question: question
    )
  end

  def new(conn, %{"district_id" => district_id, "question_id" => question_id}) do
    changeset = Choices.change_choice(%Choice{})
    district = Districts.get_district!(district_id)
    question = Questions.get_question!(question_id)

    render(conn, "new.html",
      changeset: changeset,
      question: question,
      district: district
    )
  end

  def create(conn, %{
        "choice" => choice_params,
        "district_id" => district_id,
        "question_id" => question_id
      }) do
    choice_params =
      Map.merge(
        choice_params,
        %{"district_id" => district_id, "question_id" => question_id}
      )

    case Choices.create_choice(choice_params) do
      {:ok, _choice} ->
        conn
        |> put_flash(:info, "Choice created successfully.")
        |> redirect(to: Routes.choice_path(conn, :index, district_id, question_id))

      {:error, %Ecto.Changeset{} = changeset} ->
        district = Districts.get_district!(district_id)
        question = Questions.get_question!(question_id)

        render(conn, "new.html",
          changeset: changeset,
          question: question,
          district: district
        )
    end
  end

  def edit(conn, %{"id" => id, "district_id" => district_id, "question_id" => question_id}) do
    choice = Choices.get_choice!(id)
    changeset = Choices.change_choice(choice)
    questions = Questions.list_questions()
    district = Districts.get_district!(district_id)
    question = Questions.get_question!(question_id)

    render(conn, "edit.html",
      choice: choice,
      changeset: changeset,
      questions: questions,
      district: district,
      question: question
    )
  end

  def update(conn, %{
        "id" => id,
        "choice" => choice_params,
        "district_id" => district_id,
        "question_id" => question_id
      }) do
    choice = Choices.get_choice!(id)

    case Choices.update_choice(choice, choice_params) do
      {:ok, _choice} ->
        conn
        |> put_flash(:info, "Choice updated successfully.")
        |> redirect(to: Routes.choice_path(conn, :index, district_id, question_id))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", choice: choice, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id, "district_id" => district_id, "question_id" => question_id}) do
    choice = Choices.get_choice!(id)
    {:ok, _choice} = Choices.delete_choice(choice)

    conn
    |> put_flash(:info, "Choice deleted successfully.")
    |> redirect(to: Routes.choice_path(conn, :index, district_id, question_id))
  end
end