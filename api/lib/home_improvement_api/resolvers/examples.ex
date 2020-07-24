defmodule HomeImprovementApi.Resolvers.Examples do
  @examples [
    %{id: 1, text: "Example one."}
  ]

  def example(%{id: id}, _resolution) do
    example = Enum.find(@examples, &(&1.id == id))
    {:ok, example}
  end

  def examples(_args, _resolution) do
    {:ok, @examples}
  end

  def create_example(%{input: %{text: text}}, _resolution) do
    new_example = %{
      id: length(@examples),
      text: text
    }

    {:ok, new_example}
  end

  def update_example(%{input: %{id: id, text: text}}, _resolution) do
    updated_example = %{id: id, text: text}
    {:ok, updated_example}
  end

  def delete_example(%{input: %{id: id}}, _resolution) do
    deleted_example = Enum.find(@examples, &(&1.id == id))
    {:ok, deleted_example}
  end
end
