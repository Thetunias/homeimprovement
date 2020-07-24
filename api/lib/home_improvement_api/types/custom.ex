defmodule HomeImprovementApi.Types.Custom do
  @moduledoc """
  Custom types for HomeImprovement's GraphQL API.
  """

  use Absinthe.Schema.Notation

  @desc "An error for a particular input field"
  object :field_error do
    field :type, non_null(:string)
    field :message, non_null(:string)
  end

  @desc "An error encountered while trying to persist input"
  object :input_error do
    field :field, non_null(:string)
    field :errors, non_null(list_of(non_null(:field_error)))
  end
end
