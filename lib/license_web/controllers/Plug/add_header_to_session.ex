defmodule LicenseWeb.Plugs.AddHeader do
  @behaviour Plug
  import Plug.Conn

  @moduledoc false

  def init(_params) do
  end

  def call(conn, _params) do
    conn
    |> put_resp_header("Access-Control-Allow-Origin", "*")
    |> put_resp_header("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE, PUT")
    |> put_resp_header("Access-Control-Max-Age", "3600")
    |> put_resp_header("Access-Control-Allow-Headers", "x-requested-with, authorization, content-type")
  end
end