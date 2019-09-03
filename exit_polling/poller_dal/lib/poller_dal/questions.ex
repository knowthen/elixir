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

  # TODO: write `update_question/2` function

  # TODO: write `delete_question/1` function

  # TODO: write `list_questions/0` function

  # TODO: write `get_question!/1` function
end