defmodule HomeImprovement.Repo.Migrations.CreateCourses do
  use Ecto.Migration

  def change do
    create table(:courses) do
      add :name, :string, null: false
      add :id_user_creator, references(:users, on_delete: :nothing), null: false

      timestamps(
        inserted_at: :date_inserted,
        updated_at: :date_updated,
        type: :timestamptz
      )
    end

    create index(:courses, [:id_user_creator])
    create index(:courses, [:name])
  end
end
