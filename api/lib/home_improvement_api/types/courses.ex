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

    @desc "ID of the parent lesson."
    field :id_parent, :id

    @desc "ID of the user who created the lesson."
    field :id_user_creator, non_null(:id)

    @desc "ID of the lesson's course."
    field :id_course, non_null(:id)

    @desc "Identifies the date and time when the object was created."
    field :date_inserted, non_null(:datetime)

    @desc "Identifies the date and time when the object was last updated."
    field :date_updated, non_null(:datetime)

    @desc "Name of the lesson."
    field :name, non_null(:string)

    @desc "Markup of the lesson."
    field :markup, non_null(:string)
  end

  @desc "Payload from creating, updating, deleting a course."
  object :course_payload do
    field :errors, list_of(non_null(:input_error))
    field :course, :course
  end

  @desc "Payload from creating, updating, deleting a lesson."
  object :lesson_payload do
    field :errors, list_of(non_null(:input_error))
    field :lesson, :lesson
  end

  input_object :create_course_input do
    field :id_user_creator, non_null(:id)
    field :name, non_null(:string)
  end

  input_object :create_lesson_input do
    field :id_user_creator, non_null(:id)
    field :name, non_null(:string)
    field :markup, :string
    field :id_parent, :id
    field :id_course, non_null(:id)
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

    @desc "List all courses."
    field :courses, non_null(list_of(non_null(:course))) do
      resolve &Resolvers.Courses.courses/2
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
    @desc "Create new course."
    field :create_course, :course_payload do
      arg :input, non_null(:create_course_input)
      resolve &Resolvers.Courses.create_course/2
    end

    @desc "Create new lesson."
    field :create_lesson, :lesson_payload do
      arg :input, non_null(:create_lesson_input)
      resolve &Resolvers.Courses.create_lesson/2
    end
  end
end
