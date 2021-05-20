defmodule RocketseatNlw4RocketpayWeb.UsersController do
  use RocketseatNlw4RocketpayWeb, :controller

  alias RocketseatNlw4Rocketpay.User

  action_fallback RocketseatNlw4RocketpayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- RocketseatNlw4Rocketpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
