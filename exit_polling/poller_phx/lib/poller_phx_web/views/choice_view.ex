defmodule PollerPhxWeb.ChoiceView do
  use PollerPhxWeb, :view

  alias PollerDal.Choices

  def choice_party_options(), do: Choices.parties()

  defdelegate party_description(id), to: Choices
end