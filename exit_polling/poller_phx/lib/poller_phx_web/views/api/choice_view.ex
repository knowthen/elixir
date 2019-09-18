defmodule PollerPhxWeb.Api.ChoiceView do
  use PollerPhxWeb, :view
  alias __MODULE__

  def render("index.json", %{choices: choices}) do
    render_many(choices, ChoiceView, "show.json")
  end

  def render("show.json", %{choice: choice}) do
    %{
      id: choice.id,
      question_id: choice.question_id,
      description: choice.description,
      party_id: choice.party
    }
  end
end