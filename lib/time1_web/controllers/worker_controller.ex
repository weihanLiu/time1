defmodule Time1Web.WorkerController do
  use Time1Web, :controller

  alias Time1.Workers
  alias Time1.Workers.Worker

  def index(conn, _params) do
    workers = Workers.list_workers()
    render(conn, "index.html", workers: workers)
  end

  def new(conn, _params) do
    changeset = Workers.change_worker(%Worker{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"worker" => worker_params}) do
    worker_params = Map.put(worker_params, "user_id", conn.assigns[:current_user].id)
    case Workers.create_worker(worker_params) do
      {:ok, worker} ->
        conn
        |> put_flash(:info, "Worker created successfully.")
        |> redirect(to: Routes.worker_path(conn, :show, worker))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    worker = Workers.get_worker_with_preload(id)
    render(conn, "show.html", worker: worker)
  end

  def edit(conn, %{"id" => id}) do
    worker = Workers.get_worker!(id)
    changeset = Workers.change_worker(worker)
    render(conn, "edit.html", worker: worker, changeset: changeset)
  end

  def update(conn, %{"id" => id, "worker" => worker_params}) do
    worker = Workers.get_worker!(id)

    case Workers.update_worker(worker, worker_params) do
      {:ok, worker} ->
        conn
        |> put_flash(:info, "Worker updated successfully.")
        |> redirect(to: Routes.worker_path(conn, :show, worker))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", worker: worker, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    worker = Workers.get_worker!(id)
    {:ok, _worker} = Workers.delete_worker(worker)

    conn
    |> put_flash(:info, "Worker deleted successfully.")
    |> redirect(to: Routes.worker_path(conn, :index))
  end
end
