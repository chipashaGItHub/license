defmodule LicenseWeb.RegisterController do
  use LicenseWeb, :controller
  use LicenseWeb, :universal

  def index(conn, _params) do
    conn |> render("index.html")
  end

  def phase_2(conn, params) do
    conn |> render("phase_2.html")
  end

  def solid_waste_register(conn, params) do
    conn |> render("solid_waste_register.html")
  end
end