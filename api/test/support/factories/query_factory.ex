defmodule HomeImprovementApi.QueryFactory do
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
    """,
    user: """
    query get_user($id: ID!) {
      user(id: $id) {
        id
        date_inserted
        date_updated
        experience
        name_first
        name_last
      }
    }
    """,
    course: """
    query get_course($id: ID!) {
      course(id: $id) {
        id
        date_inserted
        date_updated
        name
      }
    }
    """,
    courses: """
    query list_courses {
      courses {
        id
        date_inserted
        date_updated
        name
      }
    }
    """,
    courses_with_lessons: """
    query list_courses_with_lessons {
      courses {
        id
        date_inserted
        date_updated
        lessons {
          id
          date_inserted
          date_updated
          name
          markup
        }
        name
      }
    }
    """,
    lesson: """
    query get_lesson($id: ID!) {
      lesson(id: $id) {
        id
        id_course
        id_user_creator
        id_parent
        date_inserted
        date_updated
        name
        markup
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
