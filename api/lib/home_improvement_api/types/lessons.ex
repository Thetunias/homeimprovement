defmodule HomeImprovementApi.Types.Lessons do
    @moduledoc """
    Type, query, and mutations for `HomeImprovement.Lessons`.

    ## Usage

        import_types HomeImprovementApi.Types.Lessons

        query do
          import_fields :lessons_queries
        end

        mutation do
          import_fields :lessons_mutations
        end
    """

    use Absinthe.Schema.Notation

    alias HomeImprovementApi.Resolvers

    ##
    # Types
    ##

    @desc "Lesson object type."
    object :lesson do

      @desc "ID of the object."
      field :id, non_null(:id)

      @desc "ID of the parent object."
      field :id_parent, non_null(:id)

      @desc "ID of the course object."
      field :id_course, non_null(:id)

      @desc "Name of the lesson."
      field :name, non_null(:string)

      @desc "Name of the markup."
      field :name, non_null(:string)

      @desc "Identifies the date and time when the object was created."
      field :date_inserted, non_null(:datetime)

      @desc "Identifies the date and time when the object was last updated."
      field :date_updated, non_null(:datetime)
    end

    ##
    # Queries
    ##

    object :lessons_queries do
      @desc "Get lesson by id."
      field :lesson, :lesson do
        arg :id, non_null(:id)
        resolve &Resolvers.Lessons.lesson/2
      end
    end

    ##
    # Mutations
    ##

    object :courses_mutations do
    end
  end
