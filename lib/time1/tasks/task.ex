defmodule Time1.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :hour, :integer
    field :note, :string
    field :jobcode, :string
    belongs_to :timesheet, Time1.Timesheets.Timesheet


    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:hour, :note, :jobcode, :timesheet_id])
    |> validate_required([:hour, :note, :jobcode, :timesheet_id])
  end
end
