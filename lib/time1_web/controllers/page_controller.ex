defmodule Time1Web.PageController do
  use Time1Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def manager_home(conn, %{"user_id" => user_id}) do
    user = Time1.Users.get_user_with_preload(user_id)
    render(conn, "manager_home.html", user: user)
  end

  def worker_home(conn, %{"worker_id" => worker_id}) do
    worker = Time1.Workers.get_worker_with_preload(worker_id)
    render(conn, "worker_home.html", worker: worker)
  end
end
