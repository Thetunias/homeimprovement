defmodule HomeImprovementApi.DataCase do
  @moduledoc """
  An ExUnit.CaseTemplate which starts up `HomeImprovement.Repo` properly
  so that tests can be run which call it.
  """

  use ExUnit.CaseTemplate

  alias Ecto.Adapters.SQL.Sandbox

  using do
    quote do
      import HomeImprovementApi, only: [run: 1, run: 2]
      import HomeImprovementApi.DataCase
      import HomeImprovementApi.Factories.Query
      import HomeImprovementApi.Factories.Mutation
    end
  end

  setup tags do
    :ok = Sandbox.checkout(HomeImprovement.Repo)

    unless tags[:async] do
      Sandbox.mode(HomeImprovement.Repo, {:shared, self()})
    end

    :ok
  end
end
