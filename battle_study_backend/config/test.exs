import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :battle_study_backend, BattleStudyBackend.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "battle_study_backend_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :battle_study_backend, BattleStudyBackendWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "thAe+ZcV+SoVC3/dwsN9Vig8x0zIBpoKxTnqhDI1bAN5qlBlk3IJNtoyb2TabmHp",
  server: false

# In test we don't send emails.
config :battle_study_backend, BattleStudyBackend.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
