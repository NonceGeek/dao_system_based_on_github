defmodule DAOSystemBasedOnGithubWeb.PageController do
  use DAOSystemBasedOnGithubWeb, :controller

  def home(conn, _params) do
    render(conn, :home, active_tab: :home)
  end
end
