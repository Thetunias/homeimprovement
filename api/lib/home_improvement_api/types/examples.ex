defmodule HomeImprovementApi.Types.Examples do
  @moduledoc """
  Type, query, and mutations for `HomeImprovement.Examples`.

  ## Usage

      import_types HomeImprovementApi.Types.Examples

      query do
        import_fields :examples_queries
      end

      mutation do
        import_fields :examples_mutations
      end
  """

  use Absinthe.Schema.Notation

  alias HomeImprovementApi.Resolvers

  ##
  # Types
  ##

  @desc "Example object type."
  object :example do
    @desc "ID of the object."
    field :id, non_null(:id)

    @desc "Identifies the date and time when the object was created."
    field :date_inserted, non_null(:datetime)

    @desc "Identifies the date and time when the object was last updated."
    field :date_updated, non_null(:datetime)

    @desc "The text of the example."
    field :text, non_null(:string)
  end

  @desc "Payload from creating, updating, deleting an example."
  object :example_payload do
    field :errors, list_of(non_null(:input_error))
    field :example, :example
  end

  input_object :create_example_input do
    field :text, non_null(:string)
  end

  input_object :update_example_input do
    @desc "Id of the example to update."
    field :id, non_null(:id)

    @desc "New text of the example."
    field :text, non_null(:string)
  end

  input_object :delete_example_input do
    @desc "Id of the example to delete."
    field :id, non_null(:id)
  end

  ##
  # Queries
  ##

  object :examples_queries do
    @desc "Get example by id."
    field :example, :example do
      arg :id, non_null(:id)
      resolve &Resolvers.Examples.example/2
    end

    @desc "List all examples."
    field :examples, non_null(list_of(non_null(:example))) do
      resolve &Resolvers.Examples.examples/2
    end
  end

  ##
  # Mutations
  ##

  object :examples_mutations do
    @desc "Save a new example."
    field :create_example, non_null(:example_payload) do
      arg :input, non_null(:create_example_input)
      resolve &Resolvers.Examples.create_example/2
    end

    @desc "Update an example."
    field :update_example, non_null(:example_payload) do
      arg :input, non_null(:update_example_input)
      resolve &Resolvers.Examples.update_example/2
    end

    @desc "Delete an example."
    field :delete_example, non_null(:example_payload) do
      arg :input, non_null(:delete_example_input)
      resolve &Resolvers.Examples.delete_example/2
    end
  end
end
