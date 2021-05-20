defmodule RocketseatNlw4RocketpayWeb.FallbackController do
  use RocketseatNlw4RocketpayWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(RocketseatNlw4RocketpayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
