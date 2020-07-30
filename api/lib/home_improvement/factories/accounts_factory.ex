defmodule HomeImprovement.AccountsFactory do
  @moduledoc """
  Provides setup functions for tests related to `HomeImprovement.Accounts`. Calls the public
  interface of `HomeImprovement.Accounts` to set up test data.

  In many cases, this is preferable to creating data in the database directly
  via `HomeImprovement.Repo`, because it exercises the public API of `HomeImprovement.Accounts`
  and reveals any usability problems it may have.

  ## Example

      import HomeImprovement.AccountsFactory

      describe ".function/0" do
        setup [:create_example]

        test "my test", %{example: example} do
          # ...
        end
      end
  """

  import ExUnit.Assertions, warn: false
  import Ecto.Changeset, warn: false

  alias HomeImprovement.Accounts
  alias HomeImprovement.Accounts.User

  @doc """
  Creates a user using `HomeImprovement.Accounts.create_user/1`.
  """
  @spec create_user(Keyword.t()) :: {:ok, [user: User.t()]}
  def create_user(_ \\ []) do
    {:ok, user} =
      Accounts.create_user(%{
        name_first: Faker.Person.first_name(),
        name_last: Faker.Person.last_name()
      })

    {:ok, [user: user]}
  end
end
