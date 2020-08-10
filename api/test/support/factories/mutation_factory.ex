defmodule HomeImprovementApi.MutationFactory do
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
    """,
    create_course: """
    mutation create_course($input: CreateCourseInput!) {
      create_course(input: $input) {
        course {
          id
          date_inserted
          date_updated
          name
        }
        errors {
          field
          errors {
            message
            type
          }
        }
      }
    }
    """,
    create_lesson: """
    mutation create_lesson($input: CreateLessonInput!) {
      create_lesson(input: $input) {
        lesson {
          id
          date_inserted
          date_updated
          name
          markup
        }
        errors {
          field
          errors {
            message
            type
          }
        }
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
