defmodule Time1.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :hour, :integer, null: false
      add :note, :string, null: true
      add :jobcode, :string, null: false
      add :timesheet_id, references(:timesheets, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:timesheet_id])
  end
end
