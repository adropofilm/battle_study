defmodule BattleStudyBackend.Repo do
  use Ecto.Repo,
    otp_app: :battle_study_backend,
    adapter: Ecto.Adapters.Postgres
end
