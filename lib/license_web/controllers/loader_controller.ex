defmodule LicenseWeb.LoaderController do
  use LicenseWeb, :controller

  def index(conn, _params) do
    conn |> redirect(to: Routes.authentication_path(conn, :index))
  end
end