defmodule Time1.Repo.Migrations.CreateTimesheets do
  use Ecto.Migration

  def change do
    create table(:timesheets) do
      add :date, :date, null: false
      add :approved, :boolean, default: false, null: false
      add :worker_id, references(:workers, on_delete: :nothing)

      timestamps()
    end

    create index(:timesheets, [:worker_id])
  end
end
