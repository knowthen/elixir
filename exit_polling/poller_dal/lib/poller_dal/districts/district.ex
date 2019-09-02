defmodule PollerDal.Districts.District do
  use Ecto.Schema
  
  schema "districts" do
    field(:name, :string)
    
    timestamps()
  end
end