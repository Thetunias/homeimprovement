defmodule HomeImprovementApi.Resolvers.Courses do
  @moduledoc false

  alias HomeImprovement.Courses

  def course(%{id: id}, _resolution) do
    {:ok, Courses.get_course(id)}
  end
end
