defmodule HomeImprovementApi.Types.Courses do
  @moduledoc """
  Type, query, and mutations for `HomeImprovement.Courses`.

  ## Usage

      import_types HomeImprovementApi.Types.Courses

      query do
        import_fields :courses_queries
      end

      mutation do
        import_fields :courses_mutations
      end
  """

  use Absinthe.Schema.Notation

  alias HomeImprovementApi.Resolvers

  ##
  # Types
  ##

  @desc "Course object type."
  object :course do
    @desc "ID of the object."
    field :id, non_null(:id)

    @desc "Identifies the date and time when the object was created."
    field :date_inserted, non_null(:datetime)

    @desc "Identifies the date and time when the object was last updated."
    field :date_updated, non_null(:datetime)

    @desc "Name of the course."
    field :name, non_null(:string)
  end

  @desc "Lesson object type."
  object :lesson do
    @desc "ID of the object."
    field :id, non_null(:id)

    @desc "ID of the parent object."
    field :id_parent, :id

    @desc "ID of the course object."
    field :id_course, non_null(:id)

    @desc "Name of the lesson."
    field :name, non_null(:string)

    @desc "Name of the markup."
    field :markup, non_null(:string)

    @desc "Identifies the date and time when the object was created."
    field :date_inserted, non_null(:datetime)

    @desc "Identifies the date and time when the object was last updated."
    field :date_updated, non_null(:datetime)
  end

  ##
  # Queries
  ##

  object :courses_queries do
    @desc "Get course by id."
    field :course, :course do
      arg :id, non_null(:id)
      resolve &Resolvers.Courses.course/2
    end

    @desc "Get lesson by id."
    field :lesson, :lesson do
      arg :id, non_null(:id)
      resolve &Resolvers.Courses.lesson/2
    end
  end

  ##
  # Mutations
  ##

  object :courses_mutations do
  end
end
