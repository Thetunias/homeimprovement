defmodule HomeImprovementApi.Schema do
  @moduledoc """
  A GraphQL schema for HomeImprovement. For more info see:
  https://hexdocs.pm/absinthe/overview.html
  """

  use Absinthe.Schema

  import_types Absinthe.Type.Custom
  import_types HomeImprovementApi.Types.Custom
  import_types HomeImprovementApi.Types.Examples
  import_types HomeImprovementApi.Types.Accounts
  import_types HomeImprovementApi.Types.Courses

  @desc "The following queries can be performed against this GraphQL API."
  query do
    import_fields :accounts_queries
    import_fields :courses_queries
  end

  @desc "The following mutations can be performed against this GraphQL API."
  mutation do
    import_fields :accounts_mutations
    import_fields :courses_mutations
  end

  # Apply the HandleErrors middleware on every query, subscription or mutation
  # so that resolver functions don't have to handle their own errors.
  #
  # This is very similar to `action_fallback` in Phoenix.
  def middleware(middleware, _field, %Absinthe.Type.Object{identifier: identifier})
      when identifier in [:query, :subscription, :mutation] do
    middleware ++ [HomeImprovementApi.Middleware.HandleErrors]
  end

  def middleware(middleware, _field, _object) do
    middleware
  end
end
