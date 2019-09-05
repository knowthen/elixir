defmodule PollerDal.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  
  schema "users" do
    field(:email, :string)
    field(:password_hash, :string)
    field(:password, :string, virtual: true)
    field(:admin, :boolean, default: false)
    
    timestamps()
  end
  
  def registration_changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> validate_length(:password, min: 6)
    |> down_case_email()
    |> unique_constraint(:email)
  end
  
  defp down_case_email(changeset) do
    case get_field(changeset, :email) do
      nil -> changeset
      email -> put_change(changeset, :email, String.downcase(email))
    end
  end
end