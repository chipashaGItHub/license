defmodule LicenseWeb.Router do
  use LicenseWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug(LicenseWeb.Plugs.SetUser)
    plug(LicenseWeb.Plugs.SessionTimeout, timeout_after_seconds: 3_600)
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :un_auth do
    plug :put_layout, false
  end

#  entry point
  scope "/", LicenseWeb do
    pipe_through :browser

    get "/", LoaderController, :index
  end

  scope "/login", LicenseWeb do
    pipe_through [:browser, :un_auth]

    get "/", AuthenticationController, :index
    get "/logout", SessionController, :sign_out

  end

  scope "/dashboard", LicenseWeb do
    pipe_through :browser

    get "/", DashboardController, :index
  end

  scope "/register", LicenseWeb do
    pipe_through [:browser, :un_auth]

    get "/", RegisterController, :index
    get "/choose/method", RegisterController, :phase_2
    get "/choose/method/waste-register", RegisterController, :solid_waste_register
  end

  # Other scopes may use custom stacks.
  # scope "/api", LicenseWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: LicenseWeb.Telemetry
    end
  end
end
