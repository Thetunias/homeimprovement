defmodule HomeImprovement.Repo.Migrations.CreateLessons do
  use Ecto.Migration

  def change do
    create table(:lessons) do
      add :name, :string, null: false
      add :markup, :text, null: false
      add :id_user_creator, references(:users, on_delete: :nothing), null: false
      add :id_course, references(:courses, on_delete: :nothing), null: false
      add :id_parent, references(:lessons, on_delete: :nothing)

      timestamps(
        inserted_at: :date_inserted,
        updated_at: :date_updated,
        type: :timestamptz
      )
    end

    create index(:lessons, [:id_course])
    create index(:lessons, [:id_parent])
    create index(:lessons, [:id_user_creator])

    create unique_index(:lessons, [:name, :id_course])
  end
end
