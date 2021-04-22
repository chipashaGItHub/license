defmodule LicenseWeb.SessionController do
  use LicenseWeb, :controller
  use LicenseWeb, :universal

  def sign_out(conn, params) do
     conn
     |> configure_session(drop: true)
     |> redirect(to: Routes.authentication_path(conn, :index))
  end

end