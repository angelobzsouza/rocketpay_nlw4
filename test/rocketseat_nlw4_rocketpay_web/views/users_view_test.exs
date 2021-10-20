defmodule RocketseatNlw4RocketpayWeb.UsersViewTest do
  use RocketseatNlw4RocketpayWeb.ConnCase, async: true

  import Phoenix.View

  alias RocketseatNlw4Rocketpay.{Account, User}
  alias RocketseatNlw4RocketpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Angelo",
      password: "123456",
      nickname: "Teste",
      email: "teste@teste.com",
      age: 24
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      RocketseatNlw4Rocketpay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{balance: Decimal.new("0.00"), id: account_id},
        id: user_id,
        name: "Angelo",
        nickname: "Teste"
      }
    }

    assert expected_response == response
  end
end
