defmodule RocketseatNlw4Rocketpay.Users.CreateTest do
  use RocketseatNlw4Rocketpay.DataCase, async: true

  alias RocketseatNlw4Rocketpay.User
  alias RocketseatNlw4Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Angelo",
        password: "123456",
        nickname: "Teste",
        email: "teste@teste.com",
        age: 24
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Angelo", age: 24, id: ^user_id} = user
    end

    test "when there are invalid params" do
      params = %{
        name: "Angelo",
        password: "123456",
        nickname: "Teste",
        age: 24
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{email: ["can't be blank"]}
      assert expected_response == errors_on(changeset)
    end
  end
end
