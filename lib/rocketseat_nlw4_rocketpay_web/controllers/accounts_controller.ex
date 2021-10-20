defmodule RocketseatNlw4RocketpayWeb.AccountsController do
  use RocketseatNlw4RocketpayWeb, :controller

  alias RocketseatNlw4Rocketpay.Account
  alias RocketseatNlw4Rocketpay.Accounts.Transactions.Response, as: TransactionResponse

  action_fallback RocketseatNlw4RocketpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- RocketseatNlw4Rocketpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- RocketseatNlw4Rocketpay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <-
           RocketseatNlw4Rocketpay.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
