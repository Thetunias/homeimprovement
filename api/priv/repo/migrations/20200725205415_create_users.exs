defmodule HomeImprovement.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name_first, :string, null: false
      add :name_last, :string, null: false
      add :experience, :integer, null: false

      timestamps(inserted_at: :date_inserted, updated_at: :date_updated)
    end
  end
end
