defmodule Time1Web.Plugs.FetchCurrentUser do
  import Plug.Conn

  def init(args), do: args

  def call(conn, _args) do
    user = Time1.Users.get_user(get_session(conn, :manager_id) || -1)
    if user do
      assign(conn, :current_user, user)
    else
      assign(conn, :current_user, nil)
    end
  end
end
