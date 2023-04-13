defmodule DAOSystemBasedOnGithub.Repo do
  use Ecto.Repo,
    otp_app: :dao_system_based_on_github,
    adapter: Ecto.Adapters.Postgres
end
