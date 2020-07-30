defmodule HomeImprovementApi.Resolvers.Accounts do
  @moduledoc false

  alias HomeImprovement.Accounts

  def user(%{id: id}, _resolution) do
    {:ok, Accounts.get_user(id)}
  end
end
