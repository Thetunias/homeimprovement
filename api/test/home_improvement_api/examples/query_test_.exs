defmodule HomeImprovementApi.Examples.QueryTest do
  use HomeImprovementApi.DataCase

  import HomeImprovement.Factories.Examples,
    only: [
      create_example: 1
    ]

  describe "example" do
    setup [:create_example]

    test "returns example with id", %{example: example} do
      {:ok, %{data: data}} = run(query(:example), variables: %{id: example.id})
      assert data["example"] == example
    end

    test "returns null if given invalid id" do
      {:ok, %{data: data}} = run(query(:example), variables: %{id: 0})
      assert data["example"] == nil
    end
  end
end
