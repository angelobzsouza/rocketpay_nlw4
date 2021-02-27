defmodule RocketseatNlw4RocketpayWeb.UsersController do
  use RocketseatNlw4RocketpayWeb, :controller

  alias RocketseatNlw4Rocketpay.User

  def create(conn, params) do
    params
    |> RocketseatNlw4Rocketpay.create_user()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %User{} = user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
  end

  defp handle_response({:error, result}, conn) do
    conn
    |> put_status(:bad_request)
    |> put_view(RocketseatNlw4RocketpayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
