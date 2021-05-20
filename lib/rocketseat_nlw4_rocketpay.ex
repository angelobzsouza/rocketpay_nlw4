defmodule RocketseatNlw4Rocketpay do
  alias RocketseatNlw4Rocketpay.Users.Create, as: UserCreate

  alias RocketseatNlw4Rocketpay.Accounts.Deposit

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
end
