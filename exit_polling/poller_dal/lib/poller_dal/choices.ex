defmodule PollerDal.Choices do
  import Ecto.Query
  alias PollerDal.Repo

  alias PollerDal.Choices.Choice

  def list_choices do
    Repo.all(Choice)
  end

  def list_choices_by_question_id(question_id) do
    from(
      c in Choice,
      where: c.question_id == ^question_id
    )
    |> Repo.all()
  end

  def list_choices_by_choice_ids(choice_ids) do
    from(
      c in Choice,
      where: c.id in ^choice_ids
    )
    |> Repo.all()
  end

  def get_choice!(id) do
    Repo.get!(Choice, id)
  end

  def create_choice(attrs) do
    %Choice{}
    |> Choice.changeset(attrs)
    |> Repo.insert()
  end

  def update_choice(%Choice{} = choice, attrs) do
    choice
    |> Choice.changeset(attrs)
    |> Repo.update()
  end

  def delete_choice(%Choice{} = choice) do
    Repo.delete(choice)
  end

  def change_choice(%Choice{} = choice) do
    Choice.changeset(choice, %{})
  end
  
  defdelegate parties, to: Choice
  defdelegate party_ids, to: Choice
  defdelegate party_description(id), to: Choice
end
