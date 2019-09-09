defmodule PollerDal.Users do
  import Ecto.Query
  alias PollerDal.Repo
  alias PollerDal.Users.User
  
  def get_user!(id), do: Repo.get!(User, id)
  
  def get_user_by_email(email) do
    email = String.downcase(email)
    
    from(
      u in User,
      where: u.email == ^email
    )
    |> Repo.one()
  end
  
  def create_user(attrs) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end
  
  def put_admin(%User{} = user, admin \\ true) do
    user
    |> User.admin_changeset(%{admin: admin})
    |> Repo.update()
  end
  
  def authenticate(email, password) do
    user = get_user_by_email(email)
    
    cond do
      user && Argon2.verify_pass(password, user.password_hash) ->
        {:ok, user}
        
      user ->
        {:error, :bad_password}
        
      true ->
        {:error, :bad_email}
    end
  end
end