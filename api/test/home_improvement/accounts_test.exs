defmodule HomeImprovement.AccountsTest do
  use HomeImprovement.DataCase

  import HomeImprovement.AccountsFactory,
    only: [
      create_user: 1
    ]

  alias HomeImprovement.Accounts
  alias HomeImprovement.Accounts.User

  describe ".list_users/0" do
    setup [:create_user]

    test "returns all users", %{user: user} do
      assert Accounts.list_users() == [user]
    end
  end

  describe ".get_user!/1" do
    setup [:create_user]

    test "returns the user with given id", %{user: user} do
      assert Accounts.get_user!(user.id) == user
    end
  end

  describe ".get_user/1" do
    setup [:create_user]

    test "returns the user with given id", %{user: user} do
      assert Accounts.get_user(user.id) == user
    end

    test "returns nil with invalid id" do
      assert Accounts.get_user(0) == nil
    end
  end

  describe ".create_user/1" do
    test "creates a user" do
      assert {:ok, %User{} = user} =
               Accounts.create_user(%{
                 experience: 42,
                 name_first: "some name_first",
                 name_last: "some name_last"
               })

      assert user.experience == 42
      assert user.name_first == "some name_first"
      assert user.name_last == "some name_last"
    end

    test "returns error changeset with invalid data" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(%{})
    end
  end

  describe ".update_user/2" do
    setup [:create_user]

    test "updates the user", %{user: user} do
      assert {:ok, %User{} = user} =
               Accounts.update_user(user, %{
                 experience: 43,
                 name_first: "some updated name_first",
                 name_last: "some updated name_last"
               })

      assert user.experience == 43
      assert user.name_first == "some updated name_first"
      assert user.name_last == "some updated name_last"
    end

    test "returns error changeset with invalid data", %{user: user} do
      assert {:error, %Ecto.Changeset{}} =
               Accounts.update_user(user, %{
                 experience: [],
                 name_first: true,
                 name_last: 21
               })

      assert user == Accounts.get_user!(user.id)
    end
  end

  describe ".delete_user/1" do
    setup [:create_user]

    test "deletes the user", %{user: user} do
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end
  end

  describe ".change_user/1" do
    setup [:create_user]

    test "returns a user changeset", %{user: user} do
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
