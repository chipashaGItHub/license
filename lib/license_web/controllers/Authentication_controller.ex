defmodule LicenseWeb.AuthenticationController do
  use LicenseWeb, :controller
  use LicenseWeb, :universal

  def index(conn, _params) do
    case License.Utility.BrowserChecker.index(conn) do
      true -> conn |> put_layout(false) |> render("index.html")
      false -> conn |> put_layout(false) |> render("error.html")
    end
  end
end