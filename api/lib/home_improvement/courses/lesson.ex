defmodule HomeImprovement.Courses.Lesson do
  @moduledoc false

  use HomeImprovement.Schema

  import Ecto.Changeset

  alias HomeImprovement.Accounts.User
  alias HomeImprovement.Courses.{Course, Lesson}

  schema "lessons" do
    field :name, :string
    field :markup, :string, default: ""

    belongs_to :user_creator, User, foreign_key: :id_user_creator
    belongs_to :course, Course, foreign_key: :id_course
    belongs_to :parent, Lesson, foreign_key: :id_parent

    timestamps()
  end

  @doc false
  def changeset(lesson, attrs) do
    lesson
    |> cast(attrs, [:name, :markup, :id_user_creator, :id_course, :id_parent])
    |> validate_required([:name, :id_user_creator, :id_course])
    |> validate_length(:name, min: 1, max: 100)
    |> unique_constraint(:name)
  end
end
