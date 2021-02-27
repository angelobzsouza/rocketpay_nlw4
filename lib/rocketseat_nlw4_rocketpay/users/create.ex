defmodule RocketseatNlw4Rocketpay.Users.Create do
  alias RocketseatNlw4Rocketpay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
