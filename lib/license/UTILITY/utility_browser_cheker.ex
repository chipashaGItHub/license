defmodule License.Utility.BrowserChecker do

  def index(conn) do
    case Browser.name(conn) do
      "Chrome" -> conn |> version(52)
      "Firefox" -> conn |> version(57)
      "Edge" -> conn |> version(79)
      _ -> false
    end
  end

  defp version(conn, version) do
    Browser.version(conn) |> String.to_integer() |> IO.inspect
    if (Browser.version(conn) |> String.to_integer() >= version), do: true, else: false
  end

end