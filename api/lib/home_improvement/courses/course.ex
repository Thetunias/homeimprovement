defmodule HomeImprovement.Courses.Course do
  @moduledoc false
  use HomeImprovement.Schema
  import Ecto.Changeset

  schema "courses" do
    field :name, :string
    belongs_to(:user_creator, HomeImprovement.Accounts.User, foreign_key: :id_user_creator)

    timestamps()
  end

  @doc false
  def changeset(course, attrs) do
    course
    |> cast(attrs, [:name, :id_user_creator])
    |> validate_required([:name, :id_user_creator])
  end
end
