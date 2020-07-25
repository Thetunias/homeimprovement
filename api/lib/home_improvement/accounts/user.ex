defmodule HomeImprovement.Accounts.User do
  use HomeImprovement.Schema

  import Ecto.Changeset

  schema "users" do
    field :experience, :integer, default: 0
    field :name_first, :string
    field :name_last, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name_first, :name_last, :experience])
    |> validate_required([:name_first, :name_last, :experience])
  end
end
