defmodule Time1.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :name, :string, null: false
      add :jobcode, :string, null: false
      add :budget, :integer, null: false
      add :description, :text, null: false
      add :user_id, references(:users, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:jobs, [:user_id])
  end
end
