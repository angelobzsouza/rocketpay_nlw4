defmodule RocketseatNlw4RocketpayWeb.AccountsController do
  use RocketseatNlw4RocketpayWeb, :controller

  alias RocketseatNlw4Rocketpay.Account

  action_fallback RocketseatNlw4RocketpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- RocketseatNlw4Rocketpay.deposit(params) do
      conn
      |> put_status(:created)
      |> render("update.json", account: account)
    end
  end

  def withdraw do
  end
end
