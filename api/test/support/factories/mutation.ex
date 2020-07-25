defmodule HomeImprovementApi.Factories.Mutation do
  @moduledoc """
  Factories for generating GraphQL mutations for use in tests.
  """

  @mutations %{
    create_example: """
    mutation create_example($input: CreateExampleInput!) {
      create_example(input: $input) {
        id
        date_inserted
        date_updated
        text
      }
    }
    """,
    update_example: """
    mutation update_example($input: UpdateExampleInput!) {
      update_example(input: $input) {
        id
        date_inserted
        date_updated
        text
      }
    }
    """,
    delete_example: """
    mutation delete_example($input: DeleteExampleInput!) {
      delete_example(input: $input) {
        id
        date_inserted
        date_updated
        text
      }
    }
    """
  }

  @doc "Returns an executable GraphQL mutation with the given name."
  @spec mutation(atom) :: String.t() | nil
  def mutation(name) do
    @mutations[name]
  end
end
