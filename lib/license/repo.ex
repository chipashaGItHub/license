defmodule License.Repo do
  use Ecto.Repo,
    otp_app: :license,
    adapter: Ecto.Adapters.MyXQL
end
