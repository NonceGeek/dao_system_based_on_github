defmodule DAOSystemBasedOnGithubWeb.Router do
  use DAOSystemBasedOnGithubWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {DAOSystemBasedOnGithubWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DAOSystemBasedOnGithubWeb do
    pipe_through :browser

    live "/", PageLive, :index
    live "/readme_generator", ReadmeGeneratorLive, :index
    live "/data_panel", DataPanelLive, :index
    get "/test", PageController, :home
    live "/live/modal/:size", PageLive, :modal
    live "/live/slide_over/:origin", PageLive, :slide_over
    live "/live/pagination/:page", PageLive, :pagination
  end

  # Other scopes may use custom stacks.
  # scope "/api", DAOSystemBasedOnGithubWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:dao_system_based_on_github, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: DAOSystemBasedOnGithubWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
