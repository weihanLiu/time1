defmodule Time1Web.SessionController do
  use Time1Web, :controller

  def new(conn, %{"position" => p}) when p == "manager" do
    render(conn, "newM.html")
  end

  def new(conn, %{"position" => p}) when p == "worker" do
    render(conn, "newW.html")
  end

  def create(conn, %{"email" => email, "password" => password, "position" => p}) when p == "manager" do
    user = Time1.Users.authenticate(email, password)
    # user = Time1.Users.get_user_by_email(email)
    if user do
      conn
      |> put_session(:manager_id, user.id)
      |> put_flash(:info, "Welcome back #{user.email}")
      |> redirect(to: Routes.page_path(conn, :manager_home, user_id: user.id))
    else
      conn
      |> put_flash(:error, "Login failed.")
      |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def create(conn, %{"email" => email, "password" => password, "position" => p}) when p == "worker" do
    user = Time1.Workers.authenticate(email, password)
    # user = Time1.Workers.get_worker_by_email(email)
    if user do
      conn
      |> put_session(:worker_id, user.id)
      |> put_flash(:info, "Welcome back #{user.email}")
      |> redirect(to: Routes.page_path(conn, :worker_home, worker_id: user.id))
    else
      conn
      |> put_flash(:error, "Login failed.")
      |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def delete(conn, %{"position" => p}) when p == "manager" do
    conn
    |> delete_session(:manager_id)
    |> put_flash(:info, "Logged out.")
    |> redirect(to: Routes.page_path(conn, :index))
  end

  def delete(conn, %{"position" => p}) when p == "worker" do
    conn
    |> delete_session(:worker_id)
    |> put_flash(:info, "Logged out.")
    |> redirect(to: Routes.page_path(conn, :index))
  end

end
