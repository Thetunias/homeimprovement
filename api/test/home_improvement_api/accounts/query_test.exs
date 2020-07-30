defmodule HomeImprovementApi.Accounts.QueryTest do
  use HomeImprovementApi.DataCase

  import HomeImprovement.Factories.Accounts,
    only: [
      create_user: 1
    ]

  describe "user" do
    setup [:create_user]

    test "returns user with id", %{user: user} do
      {:ok, %{data: data}} = run(query(:user), variables: %{"id" => user.id})

      assert data["user"]["name_first"] == user.name_first
      assert data["user"]["name_last"] == user.name_last
      assert data["user"]["experience"] == user.experience
      assert data["user"]["date_inserted"]
      assert data["user"]["date_updated"]
    end

    test "returns null if given invalid id" do
      {:ok, %{data: data}} = run(query(:user), variables: %{"id" => 0})
      assert data["user"] == nil
    end
  end
end
