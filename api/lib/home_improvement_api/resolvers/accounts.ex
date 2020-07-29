defmodule HomeImprovementApi.Resolvers.Accounts do
  @moduledoc false

  alias HomeImprovement.Accounts

  def user(%{id: id}, _resolution) do
    user = Accounts.get_user!(id)
    {:ok, user}
  end
end
