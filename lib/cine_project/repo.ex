defmodule CineProject.Repo do
  use Ecto.Repo,
    otp_app: :cine_project,
    adapter: Ecto.Adapters.Postgres
end
