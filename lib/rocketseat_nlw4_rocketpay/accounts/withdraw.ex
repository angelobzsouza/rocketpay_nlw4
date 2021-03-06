defmodule RocketseatNlw4Rocketpay.Accounts.Withdraw do
  alias RocketseatNlw4Rocketpay.Accounts.Operation
  alias RocketseatNlw4Rocketpay.Repo

  def call(params) do
    params
    |> Operation.call(:withdraw)
    |> run_transaction()
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{withdraw: account}} -> {:ok, account}
    end
  end
end
