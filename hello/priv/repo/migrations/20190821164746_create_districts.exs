defmodule Hello.Repo.Migrations.CreateDistricts do
  use Ecto.Migration

  def change do
    create table(:districts) do
      add :name, :string

      timestamps()
    end

  end
end
