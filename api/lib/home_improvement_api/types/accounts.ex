defmodule HomeImprovementApi.Types.Accounts do
  @moduledoc """
  Type, query, and mutations for `HomeImprovement.Accounts`.

  ## Usage

      import_types HomeImprovementApi.Types.Accounts

      query do
        import_fields :accounts_queries
      end

      mutation do
        import_fields :accounts_mutations
      end
  """

  use Absinthe.Schema.Notation

  alias HomeImprovementApi.Resolvers

  ##
  # Types
  ##

  @desc "Example object type."
  object :user do
    @desc "ID of the object."
    field :id, non_null(:id)

    @desc "Identifies the date and time when the object was created."
    field :date_inserted, non_null(:datetime)

    @desc "Identifies the date and time when the object was last updated."
    field :date_updated, non_null(:datetime)

    @desc "First name of the user."
    field :name_first, non_null(:string)

    @desc "Last name of the user."
    field :name_last, non_null(:string)
  end

  ##
  # Queries
  ##

  object :accounts_queries do
    @desc "Get user by id."
    field :user, :user do
      arg :id, non_null(:id)
      resolve &Resolvers.Accounts.user/2
    end
  end

  ##
  # Mutations
  ##

  object :accounts_mutations do
  end
end
