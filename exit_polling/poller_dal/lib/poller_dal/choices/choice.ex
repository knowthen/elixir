defmodule PollerDal.Choices.Choice do
  use Ecto.Schema
  import Ecto.Changeset
    
  @parties [
    {"Democrat", 1},
    {"Republican", 2}
  ]
  @party_ids Enum.map(@parties, fn {_, id} -> id end)

  schema "choices" do
    field(:description, :string)
    field(:votes, :integer, default: 0)
    field(:party, :integer)
    belongs_to(:question, PollerDal.Questions.Question)

    timestamps()
  end

  def changeset(choice, attrs) do
    choice
    |> cast(attrs, [:description, :question_id, :party, :votes])
    |> validate_required([:description, :question_id, :party])
    |> validate_inclusion(:party, @party_ids)
    |> assoc_constraint(:question)
  end
    
  def parties(), do: @parties
  def party_ids(), do: @party_ids

  def party_description(id) do
    case Enum.find(@parties, fn {_, party_id} -> party_id == id end) do
      nil -> ""
      {description, _} -> description
    end
  end
end