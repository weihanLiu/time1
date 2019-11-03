defmodule Time1.Repo.Migrations.AddPasswordHashworker do
  use Ecto.Migration

  def change do
    alter table("workers") do
      add :password_hash, :string, default: "", null: false
    end
  end
end
