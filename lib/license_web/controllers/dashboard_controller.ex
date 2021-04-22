defmodule LicenseWeb.DashboardController do
  use LicenseWeb, :controller
  use LicenseWeb, :universal

  def index(conn, params) do
   conn |> render("index.html")
  end
end