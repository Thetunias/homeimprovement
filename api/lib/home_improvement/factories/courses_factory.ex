defmodule HomeImprovement.CoursesFactory do
  @moduledoc """
  Provides setup functions for tests related to `HomeImprovement.Courses`. Calls the public
  interface of `HomeImprovement.Courses` to set up test data.

  In many cases, this is preferable to creating data in the database directly
  via `HomeImprovement.Repo`, because it exercises the public API of `HomeImprovement.Courses`
  and reveals any usability problems it may have.

  ## Example

      import HomeImprovement.CoursesFactory

      describe ".function/0" do
        setup [:create_course]

        test "my test", %{course: course} do
          # ...
        end
      end
  """

  import ExUnit.Assertions, warn: false
  import Ecto.Changeset, warn: false

  alias HomeImprovement.Courses
  alias HomeImprovement.Courses.Course

  @doc """
  Creates a course using `HomeImprovement.Courses.create_course/1`,
  using `context[:user]` as the creator.

  Must be used together with `HomeImprovement.AccountsFactory.create_user/1`.
  """
  @spec create_course(Keyword.t()) :: {:ok, [course: %Course{}]}
  def create_course(context \\ []) do
    {:ok, course} =
      Courses.create_course(%{
        name: Faker.Industry.sector(),
        id_user_creator: context[:user].id
      })

    {:ok, [course: course]}
  end
end
