defmodule HomeImprovementApi.Factories.Query do
  @moduledoc """
  Factories for generating GraphQL queries for use in tests.
  """

  @queries %{
    example: """
    query get_example($id: ID!) {
      example(id: $id) {
        id
        date_inserted
        date_updated
        text
      }
    }
    """,
    examples: """
    query list_examples {
      examples {
        id
        date_inserted
        date_updated
        text
      }
    }
    """
  }

  @doc "Returns an executable GraphQL query with the given name."
  @spec query(atom) :: String.t() | nil
  def query(name) do
    @queries[name]
  end
end
