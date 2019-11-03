defmodule Time1Web.Plugs.FetchCurrentWorker do
  import Plug.Conn

  def init(args), do: args

  def call(conn, _args) do
    worker = Time1.Workers.get_worker(get_session(conn, :worker_id) || -1)

    if worker do
      assign(conn, :current_worker, worker)
    else
      assign(conn, :current_worker, nil)
    end
  end
end
