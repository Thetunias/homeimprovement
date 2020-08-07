defmodule HomeImprovementApi.Resolvers.Courses do
  @moduledoc false

  alias HomeImprovement.Courses

  def course(%{id: id}, _resolution) do
    {:ok, Courses.get_course(id)}
  end

  def courses(_args, _resolution) do
    {:ok, Courses.list_courses()}
  end

  def lesson(%{id: id}, _resolution) do
    {:ok, Courses.get_lesson(id)}
  end

  def create_course(%{input: attrs}, _resolution) do
    with {:ok, course} <- Courses.create_course(attrs) do
      {:ok, %{course: course}}
    end
  end
end
