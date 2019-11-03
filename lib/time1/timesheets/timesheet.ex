defmodule Time1.Timesheets.Timesheet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "timesheets" do
    field :approved, :boolean, default: false
    field :date, :date
    belongs_to :worker, Time1.Workers.Worker
    has_many :tasks, Time1.Tasks.Task

    timestamps()
  end

  @doc false
  def changeset(timesheet, attrs) do
    timesheet
    |> cast(attrs, [:date, :worker_id])
    |> validate_required([:date, :worker_id])
  end
end
