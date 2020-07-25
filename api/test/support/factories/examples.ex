defmodule HomeImprovement.Factories.Examples do
  @moduledoc """
  Provides setup functions for tests related to `HomeImprovement.Examples`. Calls the public
  interface of `HomeImprovement.Examples` to set up test data.

  In many cases, this is preferable to creating data in the database directly
  via `HomeImprovement.Repo`, because it exercises the public API of `HomeImprovement.Examples`
  and reveals any usability problems it may have.

  ## Example

      import HomeImprovement.ExamplesFactory

      describe ".function/0" do
        setup [:create_example]

        test "my test", %{example: example} do
          # ...
        end
      end
  """

  import ExUnit.Assertions
  import Ecto.Changeset

  alias HomeImprovement.{Examples, Repo}

  @doc """
  Creates a example using `HomeImprovement.Examples.create_example/1`.
  """
  @spec create_example(Keyword.t()) :: {:ok, [example: Example.t()]}
  def create_example(_) do
    {:ok, example} =
      Examples.create_example(%{
        text: "test text"
      })

    {:ok, [example: example]}
  end
end
