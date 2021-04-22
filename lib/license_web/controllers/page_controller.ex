defmodule LicenseWeb.PageController do
  use LicenseWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
