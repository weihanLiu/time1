defmodule Time1Web.Router do
  use Time1Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug Time1Web.Plugs.FetchCurrentWorker
    plug Time1Web.Plugs.FetchCurrentUser
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers

  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Time1Web do
    pipe_through :browser

    get "/", PageController, :index
    get "/manager_home", PageController, :manager_home
    get "/worker_home", PageController, :worker_home
    resources "/users", UserController
    resources "/jobs", JobController
    resources "/workers", WorkerController
    resources "/timesheets", TimesheetController
    resources "/tasks", TaskController
    resources "/sessions", SessionController,
      only: [:new, :create, :delete], singleton: true

    get "/timesheet/showM", TimesheetController, :showM
    get "/timesheet/showW", TimesheetController, :showW
    get "/timesheet/approveSheet", TimesheetController, :approveSheet
  end

  # Other scopes may use custom stacks.
  # scope "/api", Time1Web do
  #   pipe_through :api
  # end
end
