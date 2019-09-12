defmodule PollerDal.Questions do
  import Ecto.Query
  alias PollerDal.Repo
  alias PollerDal.Questions.Question
  
  def list_questions_by_district_id(district_id) do
    from(
      q in Question,
      where: q.district_id == ^district_id
    )
    |> Repo.all()
  end
  
  # TODO: write `create_question/1` function
  def create_question(attrs) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  # TODO: write `update_question/2` function
  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  # TODO: write `delete_question/1` function
  def delete_question(%Question{} = question) do
    Repo.delete(question)
  end

  # TODO: write `list_questions/0` function
  def list_questions do
    Question |> preload(:district) |> Repo.all()
  end

  # TODO: write `get_question!/1` function
  def get_question!(id), do: Repo.get!(Question, id)
  
  def change_question(%Question{} = question) do
    Question.changeset(question, %{})
  end
end