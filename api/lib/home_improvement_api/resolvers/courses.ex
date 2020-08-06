defmodule HomeImprovementApi.Resolvers.Courses do
  @moduledoc false

  alias HomeImprovement.Courses

  def course(%{id: id}, _resolution) do
    {:ok, Courses.get_course(id)}
  end

  def lesson(%{id: id}, _resolution) do
    {:ok, Courses.get_lesson(id)}
  end

  def create_course(%{input: course}, _resolution) do
    case Courses.create_course(course) do
      {:ok, course} ->
        {:ok, %{course: course}}

      {:error, reason} ->
        IO.inspect(reason)

        {:error, reason.errors}
    end
  end
end
