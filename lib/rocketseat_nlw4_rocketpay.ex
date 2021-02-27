defmodule RocketseatNlw4Rocketpay do
  alias RocketseatNlw4Rocketpay.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
