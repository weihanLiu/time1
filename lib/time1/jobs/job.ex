defmodule Time1.Jobs.Job do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jobs" do
    field :budget, :integer
    field :description, :string
    field :jobcode, :string
    field :name, :string
    belongs_to :user, Time1.Users.User


    timestamps()
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:name, :jobcode, :budget, :description, :user_id])
    |> validate_required([:name, :jobcode, :budget, :description, :user_id])
  end
end
