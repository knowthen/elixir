defmodule Hello.Districts.District do
  use Ecto.Schema
  import Ecto.Changeset

  schema "districts" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(district, attrs) do
    district
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
