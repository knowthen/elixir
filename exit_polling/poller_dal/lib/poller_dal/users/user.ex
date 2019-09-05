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
    |> put_password_hash()
  end
  
  def admin_changeset(user, attrs) do
    user
    |> cast(attrs, [:admin])
  end
  
  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Argon2.hash_pwd_salt(password))
        
      _ ->
        changeset  
    end
  end
  
  defp down_case_email(changeset) do
    case get_field(changeset, :email) do
      nil -> changeset
      email -> put_change(changeset, :email, String.downcase(email))
    end
  end
end