use Mix.Config

# Configure your database
config :time1, Time1.Repo,
  username: "time1",
  password: "lwh123456",
  database: "time1_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :time1, Time1Web.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
